import "dotenv/config"

import { PrismaPg } from "@prisma/adapter-pg"

import { PrismaClient } from "../app/generated/prisma/client"

const adapter = new PrismaPg({
  connectionString: process.env.DATABASE_URL,
})

const prisma = new PrismaClient({ adapter })

const SEED_PREFIX = "mass-seed"
const CUSTOMER_COUNT = 160
const PROVIDER_COUNT = 45
const SERVICE_PER_PROVIDER = 6
const BOOKINGS_PER_CUSTOMER = 8
const REVIEW_RATE = 0.6
const PAYMENT_SUCCESS_RATE = 0.72

const cities = [
  "Bengaluru",
  "Mumbai",
  "Delhi",
  "Hyderabad",
  "Pune",
  "Chennai",
  "Kolkata",
  "Ahmedabad",
]

const categories = [
  "Deep Cleaning",
  "Maintenance",
  "Move Cleaning",
  "Bathroom Cleaning",
  "Kitchen Cleaning",
  "Sofa Cleaning",
  "Carpet Cleaning",
]

const areas = [
  "Central",
  "North",
  "South",
  "East",
  "West",
  "Urban Zone",
  "Metro Belt",
]

function idFor(entity: string, index: number) {
  return `${SEED_PREFIX}-${entity}-${index}`
}

function randomInt(min: number, max: number) {
  return Math.floor(Math.random() * (max - min + 1)) + min
}

function randomFloat(min: number, max: number) {
  return Number((Math.random() * (max - min) + min).toFixed(2))
}

function pick<T>(items: T[]) {
  return items[randomInt(0, items.length - 1)]
}

function addDays(date: Date, days: number) {
  const next = new Date(date)
  next.setDate(next.getDate() + days)
  return next
}

type SeedUser = {
  id: string
  email: string
  name: string
  role: "CUSTOMER" | "PROVIDER" | "ADMIN"
}

type SeedService = {
  id: string
  providerId: string
  title: string
  description: string
  category: string
  city: string
  price: number
  durationMinutes: number
}

type BookingStatus =
  | "PENDING"
  | "CONFIRMED"
  | "IN_PROGRESS"
  | "COMPLETED"
  | "CANCELLED"

type PaymentStatus = "PENDING" | "SUCCESS" | "FAILED" | "REFUNDED"

function generateUsers() {
  const customers: SeedUser[] = []
  const providers: SeedUser[] = []

  for (let i = 1; i <= CUSTOMER_COUNT; i += 1) {
    customers.push({
      id: idFor("customer", i),
      email: `${SEED_PREFIX}.customer${i}@demo.local`,
      name: `Customer ${i}`,
      role: "CUSTOMER",
    })
  }

  for (let i = 1; i <= PROVIDER_COUNT; i += 1) {
    providers.push({
      id: idFor("provider", i),
      email: `${SEED_PREFIX}.provider${i}@demo.local`,
      name: `Provider ${i}`,
      role: "PROVIDER",
    })
  }

  const admins: SeedUser[] = [
    {
      id: idFor("admin", 1),
      email: `${SEED_PREFIX}.admin1@demo.local`,
      name: "Marketplace Admin",
      role: "ADMIN",
    },
  ]

  return { customers, providers, admins }
}

function generateServices(providers: SeedUser[]) {
  const services: SeedService[] = []
  let idx = 1

  for (const provider of providers) {
    for (let s = 1; s <= SERVICE_PER_PROVIDER; s += 1) {
      const category = pick(categories)
      const city = pick(cities)

      services.push({
        id: idFor("service", idx),
        providerId: provider.id,
        title: `${category} Package ${s}`,
        description: `${category} for apartments and homes with trained professionals.`,
        category,
        city,
        price: randomInt(499, 4999),
        durationMinutes: pick([60, 90, 120, 150, 180, 240]),
      })

      idx += 1
    }
  }

  return services
}

async function resetExistingMassSeedData() {
  await prisma.review.deleteMany({
    where: { id: { startsWith: `${SEED_PREFIX}-` } },
  })
  await prisma.payment.deleteMany({
    where: { id: { startsWith: `${SEED_PREFIX}-` } },
  })
  await prisma.booking.deleteMany({
    where: { id: { startsWith: `${SEED_PREFIX}-` } },
  })
  await prisma.notification.deleteMany({
    where: { id: { startsWith: `${SEED_PREFIX}-` } },
  })
  await prisma.service.deleteMany({
    where: { id: { startsWith: `${SEED_PREFIX}-` } },
  })
  await prisma.providerProfile.deleteMany({
    where: { id: { startsWith: `${SEED_PREFIX}-` } },
  })
  await prisma.user.deleteMany({
    where: { id: { startsWith: `${SEED_PREFIX}-` } },
  })
}

async function seedUsers(
  customers: SeedUser[],
  providers: SeedUser[],
  admins: SeedUser[]
) {
  const all = [...customers, ...providers, ...admins]

  await prisma.user.createMany({
    data: all.map((user) => ({
      id: user.id,
      email: user.email,
      name: user.name,
      role: user.role,
      password: "seed-password",
      emailVerified: true,
    })),
    skipDuplicates: true,
  })

  await prisma.providerProfile.createMany({
    data: providers.map((provider, index) => ({
      id: idFor("provider-profile", index + 1),
      userId: provider.id,
      bio: `Professional cleaner with ${randomInt(2, 12)} years of field experience.`,
      experience: randomInt(2, 12),
      serviceArea: `${pick(cities)} ${pick(areas)}`,
      averageRating: randomFloat(4.0, 4.9),
      totalReviews: randomInt(20, 480),
    })),
    skipDuplicates: true,
  })
}

async function seedServices(services: SeedService[]) {
  await prisma.service.createMany({
    data: services.map((service) => ({
      id: service.id,
      providerId: service.providerId,
      title: service.title,
      description: service.description,
      category: service.category,
      city: service.city,
      price: service.price,
      durationMinutes: service.durationMinutes,
      isActive: true,
    })),
    skipDuplicates: true,
  })
}

type CreatedBooking = {
  id: string
  providerId: string
  customerId: string
  serviceId: string
  totalAmount: number
  status: BookingStatus
  paymentStatus: PaymentStatus
}

async function seedBookingsPaymentsReviewsAndNotifications(
  customers: SeedUser[],
  providers: SeedUser[],
  services: SeedService[]
) {
  const bookingsToCreate: {
    id: string
    serviceId: string
    customerId: string
    providerId: string
    scheduleAt: Date
    address: string
    notes: string
    status: BookingStatus
    paymentStatus: PaymentStatus
    totalAmount: number
  }[] = []

  const createdBookingRefs: CreatedBooking[] = []

  let bookingIndex = 1
  const now = new Date()

  for (const customer of customers) {
    for (let i = 0; i < BOOKINGS_PER_CUSTOMER; i += 1) {
      const service = pick(services)

      const statusPool: BookingStatus[] = [
        "PENDING",
        "CONFIRMED",
        "IN_PROGRESS",
        "COMPLETED",
        "CANCELLED",
      ]

      const status = pick(statusPool)

      let paymentStatus: PaymentStatus = "PENDING"
      if (
        status === "COMPLETED" ||
        status === "IN_PROGRESS" ||
        status === "CONFIRMED"
      ) {
        paymentStatus =
          Math.random() < PAYMENT_SUCCESS_RATE ? "SUCCESS" : "FAILED"
      }
      if (status === "CANCELLED") {
        paymentStatus = "PENDING"
      }

      const id = idFor("booking", bookingIndex)
      const scheduleAt = addDays(now, randomInt(-40, 60))

      bookingsToCreate.push({
        id,
        serviceId: service.id,
        customerId: customer.id,
        providerId: service.providerId,
        scheduleAt,
        address: `${randomInt(10, 999)}, ${pick(areas)}, ${service.city}`,
        notes: "Seeded booking generated for load testing and UI demos.",
        status,
        paymentStatus,
        totalAmount: service.price,
      })

      createdBookingRefs.push({
        id,
        providerId: service.providerId,
        customerId: customer.id,
        serviceId: service.id,
        totalAmount: service.price,
        status,
        paymentStatus,
      })

      bookingIndex += 1
    }
  }

  await prisma.booking.createMany({
    data: bookingsToCreate,
    skipDuplicates: true,
  })

  const payments = createdBookingRefs
    .filter((booking) => booking.paymentStatus !== "PENDING")
    .map((booking, index) => ({
      id: idFor("payment", index + 1),
      bookingId: booking.id,
      customerId: booking.customerId,
      providerId: booking.providerId,
      amount: booking.totalAmount,
      status: booking.paymentStatus,
      transactionRef: `${SEED_PREFIX}-txn-${booking.id}`,
      method: "mock",
    }))

  await prisma.payment.createMany({
    data: payments,
    skipDuplicates: true,
  })

  const completedBookings = createdBookingRefs.filter(
    (booking) => booking.status === "COMPLETED"
  )

  const reviews = completedBookings
    .filter(() => Math.random() < REVIEW_RATE)
    .map((booking, index) => ({
      id: idFor("review", index + 1),
      bookingId: booking.id,
      serviceId: booking.serviceId,
      customerId: booking.customerId,
      providerId: booking.providerId,
      rating: randomInt(3, 5),
      comment: "Seeded review: service was professional and on time.",
      isHidden: false,
    }))

  await prisma.review.createMany({
    data: reviews,
    skipDuplicates: true,
  })

  const notifications: {
    id: string
    userId: string
    title: string
    message: string
    type: "BOOKING" | "PAYMENT" | "REVIEW" | "SYSTEM"
    isRead: boolean
  }[] = []

  let notificationIndex = 1

  for (const booking of createdBookingRefs.slice(0, 1000)) {
    notifications.push({
      id: idFor("notification", notificationIndex),
      userId: booking.customerId,
      title: "Booking status updated",
      message: `Booking ${booking.id} status: ${booking.status}`,
      type: "BOOKING",
      isRead: Math.random() < 0.4,
    })
    notificationIndex += 1

    notifications.push({
      id: idFor("notification", notificationIndex),
      userId: booking.providerId,
      title: "New booking activity",
      message: `A booking linked to your service is ${booking.status.toLowerCase()}.`,
      type: "BOOKING",
      isRead: Math.random() < 0.5,
    })
    notificationIndex += 1
  }

  for (const provider of providers.slice(0, 30)) {
    notifications.push({
      id: idFor("notification", notificationIndex),
      userId: provider.id,
      title: "Weekly performance digest",
      message: "You have new customer interactions this week.",
      type: "SYSTEM",
      isRead: false,
    })
    notificationIndex += 1
  }

  await prisma.notification.createMany({
    data: notifications,
    skipDuplicates: true,
  })

  return {
    bookingCount: bookingsToCreate.length,
    paymentCount: payments.length,
    reviewCount: reviews.length,
    notificationCount: notifications.length,
  }
}

async function main() {
  console.log("Starting massive seed...")
  await resetExistingMassSeedData()

  const { customers, providers, admins } = generateUsers()
  const services = generateServices(providers)

  await seedUsers(customers, providers, admins)
  await seedServices(services)
  const stats = await seedBookingsPaymentsReviewsAndNotifications(
    customers,
    providers,
    services
  )

  console.log("Massive seed completed")
  console.log(
    JSON.stringify(
      {
        users: customers.length + providers.length + admins.length,
        customers: customers.length,
        providers: providers.length,
        admins: admins.length,
        services: services.length,
        bookings: stats.bookingCount,
        payments: stats.paymentCount,
        reviews: stats.reviewCount,
        notifications: stats.notificationCount,
      },
      null,
      2
    )
  )
}

main()
  .catch((error) => {
    console.error("Seed failed", error)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
