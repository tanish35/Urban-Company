import Link from "next/link"

import { SiteShell } from "@/components/layout/site-shell"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card"
import { getSession } from "@/lib/auth-server"
import { formatCurrencyINR } from "@/lib/format"
import prisma from "@/lib/prisma"

export default async function ProfilePage() {
  const session = await getSession()

  if (!session) {
    return (
      <SiteShell>
        <Card className="mx-auto max-w-lg border-border/60">
          <CardHeader>
            <CardTitle>Login required</CardTitle>
            <CardDescription>
              Sign in to access your profile and activity.
            </CardDescription>
          </CardHeader>
          <CardContent>
            <Button asChild>
              <Link href="/login">Go to login</Link>
            </Button>
          </CardContent>
        </Card>
      </SiteShell>
    )
  }

  const [providerProfile, recentBookings, recentReviews, payments] =
    await Promise.all([
      prisma.providerProfile.findUnique({ where: { userId: session.user.id } }),
      prisma.booking.findMany({
        where: {
          OR: [
            { customerId: session.user.id },
            { providerId: session.user.id },
          ],
        },
        include: {
          service: true,
        },
        orderBy: { createdAt: "desc" },
        take: 6,
      }),
      prisma.review.findMany({
        where: {
          OR: [
            { customerId: session.user.id },
            { providerId: session.user.id },
          ],
        },
        include: {
          service: true,
        },
        orderBy: { createdAt: "desc" },
        take: 6,
      }),
      prisma.payment.aggregate({
        where: { customerId: session.user.id, status: "SUCCESS" },
        _sum: { amount: true },
      }),
    ])

  return (
    <SiteShell>
      <section className="space-y-6">
        <div className="relative overflow-hidden rounded-2xl border border-border/60 bg-gradient-to-br from-background to-muted/40 p-6">
          <div className="pointer-events-none absolute -top-14 -right-10 size-40 rounded-full bg-primary/10 blur-2xl" />
          <div className="space-y-3">
            <div className="flex flex-wrap items-center gap-2">
              <Badge variant="secondary">Account</Badge>
              <Badge>{session.user.role}</Badge>
              <Badge
                variant={session.user.emailVerified ? "default" : "outline"}
              >
                {session.user.emailVerified ? "Verified" : "Not verified"}
              </Badge>
            </div>
            <h1 className="font-heading text-3xl font-semibold tracking-tight sm:text-4xl">
              {session.user.name ?? "Urban Clean User"}
            </h1>
            <p className="text-sm text-muted-foreground sm:text-base">
              {session.user.email}
            </p>
          </div>
        </div>

        <div className="grid gap-4 lg:grid-cols-3">
          <Card className="border-border/60">
            <CardHeader>
              <CardTitle className="text-lg">Total paid</CardTitle>
            </CardHeader>
            <CardContent className="text-3xl font-semibold tracking-tight">
              INR {formatCurrencyINR(Number(payments._sum.amount ?? 0))}
            </CardContent>
          </Card>
          <Card className="border-border/60">
            <CardHeader>
              <CardTitle className="text-lg">Bookings</CardTitle>
            </CardHeader>
            <CardContent className="text-3xl font-semibold tracking-tight">
              {recentBookings.length}
            </CardContent>
          </Card>
          <Card className="border-border/60">
            <CardHeader>
              <CardTitle className="text-lg">Reviews</CardTitle>
            </CardHeader>
            <CardContent className="text-3xl font-semibold tracking-tight">
              {recentReviews.length}
            </CardContent>
          </Card>
        </div>

        {providerProfile ? (
          <Card className="border-border/60">
            <CardHeader>
              <CardTitle>Provider profile</CardTitle>
              <CardDescription>
                Public provider details visible to customers.
              </CardDescription>
            </CardHeader>
            <CardContent className="grid gap-2 text-sm sm:grid-cols-2">
              <p>
                <span className="text-muted-foreground">Bio:</span>{" "}
                {providerProfile.bio ?? "-"}
              </p>
              <p>
                <span className="text-muted-foreground">Experience:</span>{" "}
                {providerProfile.experience} years
              </p>
              <p>
                <span className="text-muted-foreground">Service area:</span>{" "}
                {providerProfile.serviceArea ?? "-"}
              </p>
              <p>
                <span className="text-muted-foreground">Rating:</span>{" "}
                {providerProfile.averageRating?.toString() ?? "0"} (
                {providerProfile.totalReviews} reviews)
              </p>
            </CardContent>
          </Card>
        ) : null}

        <div className="grid gap-4 lg:grid-cols-2">
          <Card className="border-border/60">
            <CardHeader>
              <CardTitle>Recent bookings</CardTitle>
            </CardHeader>
            <CardContent className="space-y-2 text-sm">
              {recentBookings.map((booking) => (
                <div
                  key={booking.id}
                  className="rounded-md border border-border/60 p-3"
                >
                  <p className="font-medium">{booking.service.title}</p>
                  <p className="text-muted-foreground">{booking.status}</p>
                </div>
              ))}
              {recentBookings.length === 0 ? (
                <p className="text-muted-foreground">No bookings yet.</p>
              ) : null}
            </CardContent>
          </Card>

          <Card className="border-border/60">
            <CardHeader>
              <CardTitle>Recent reviews</CardTitle>
            </CardHeader>
            <CardContent className="space-y-2 text-sm">
              {recentReviews.map((review) => (
                <div
                  key={review.id}
                  className="rounded-md border border-border/60 p-3"
                >
                  <p className="font-medium">{review.service.title}</p>
                  <p className="text-muted-foreground">{review.rating}/5</p>
                </div>
              ))}
              {recentReviews.length === 0 ? (
                <p className="text-muted-foreground">No reviews yet.</p>
              ) : null}
            </CardContent>
          </Card>
        </div>
      </section>
    </SiteShell>
  )
}
