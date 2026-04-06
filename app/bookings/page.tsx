"use client"

import * as React from "react"

import { BookingList } from "@/components/bookings/booking-list"
import { ReviewForm } from "@/components/reviews/review-form"
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
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"

type BookingItem = {
  id: string
  status: string
  paymentStatus: string
  scheduleAt: string
  address: string
  totalAmount: number | string
  service?: {
    title: string
  }
}

export default function BookingsPage() {
  const [bookings, setBookings] = React.useState<BookingItem[]>([])
  const [status, setStatus] = React.useState("")
  const [bookingIdForReview, setBookingIdForReview] = React.useState("")
  const [bookingIdForPayment, setBookingIdForPayment] = React.useState("")
  const [message, setMessage] = React.useState<string | null>(null)
  const [loading, setLoading] = React.useState(false)

  const query = React.useMemo(() => {
    const params = new URLSearchParams()
    if (status) params.set("status", status)
    return params.toString()
  }, [status])

  const loadBookings = React.useCallback(async () => {
    setLoading(true)
    const response = await fetch(`/api/bookings${query ? `?${query}` : ""}`)

    if (response.ok) {
      const payload = (await response.json()) as { data: BookingItem[] }
      setBookings(payload.data)
    }
    setLoading(false)
  }, [query])

  React.useEffect(() => {
    void loadBookings()
  }, [loadBookings])

  async function payForBooking() {
    setMessage(null)

    const response = await fetch("/api/payments", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ bookingId: bookingIdForPayment }),
    })

    if (!response.ok) {
      const payload = (await response.json().catch(() => null)) as {
        error?: string
      } | null
      setMessage(payload?.error ?? "Payment failed")
      return
    }

    setMessage("Payment recorded successfully")
    setBookingIdForPayment("")
    await loadBookings()
  }

  return (
    <SiteShell>
      <section className="space-y-6">
        <div className="relative overflow-hidden rounded-2xl border border-border/60 bg-gradient-to-br from-background to-muted/40 p-6">
          <div className="pointer-events-none absolute -top-14 -right-10 size-40 rounded-full bg-chart-2/10 blur-2xl" />
          <div className="space-y-3">
            <div className="flex flex-wrap items-center gap-2">
              <Badge variant="secondary">Bookings Hub</Badge>
              <Badge variant="outline">{bookings.length} items</Badge>
            </div>
            <h1 className="font-heading text-3xl font-semibold tracking-tight sm:text-4xl">
              Track bookings with less friction
            </h1>
            <p className="max-w-3xl text-sm text-muted-foreground sm:text-base">
              Filter status, pay pending bookings, and submit reviews from one
              optimized workflow.
            </p>
          </div>
        </div>

        <Card className="border-border/60">
          <CardHeader>
            <CardTitle className="text-lg">Filter bookings</CardTitle>
            <CardDescription>
              Use status tags like PENDING, CONFIRMED, or COMPLETED.
            </CardDescription>
          </CardHeader>
          <CardContent className="grid gap-2 md:max-w-xs">
            <Label htmlFor="status">Status</Label>
            <Input
              id="status"
              value={status}
              onChange={(event) => setStatus(event.target.value)}
              placeholder="PENDING"
            />
          </CardContent>
        </Card>

        {loading ? (
          <Card className="border-border/60">
            <CardContent className="text-sm text-muted-foreground">
              Loading bookings...
            </CardContent>
          </Card>
        ) : (
          <BookingList bookings={bookings} />
        )}

        <div className="grid gap-4 lg:grid-cols-2">
          <Card className="border-border/60">
            <CardHeader>
              <CardTitle className="text-lg">Pay a booking</CardTitle>
              <CardDescription>
                Enter booking id and complete a mock payment instantly.
              </CardDescription>
            </CardHeader>
            <CardContent className="grid gap-4">
              <div className="grid gap-2">
                <Label htmlFor="paymentBookingId">Booking ID</Label>
                <Input
                  id="paymentBookingId"
                  value={bookingIdForPayment}
                  onChange={(event) =>
                    setBookingIdForPayment(event.target.value)
                  }
                />
              </div>
              <Button onClick={payForBooking}>Pay now (mock)</Button>
              {message ? (
                <p className="text-sm text-muted-foreground">{message}</p>
              ) : null}
            </CardContent>
          </Card>

          <Card className="border-border/60">
            <CardHeader>
              <CardTitle className="text-lg">Submit review</CardTitle>
              <CardDescription>
                Share feedback after service completion.
              </CardDescription>
            </CardHeader>
            <CardContent className="grid gap-4">
              <div className="grid gap-2">
                <Label htmlFor="reviewBookingId">Booking ID</Label>
                <Input
                  id="reviewBookingId"
                  value={bookingIdForReview}
                  onChange={(event) =>
                    setBookingIdForReview(event.target.value)
                  }
                />
              </div>
              {bookingIdForReview ? (
                <ReviewForm bookingId={bookingIdForReview} />
              ) : (
                <p className="text-sm text-muted-foreground">
                  Enter a booking id to open the review form.
                </p>
              )}
            </CardContent>
          </Card>
        </div>
      </section>
    </SiteShell>
  )
}
