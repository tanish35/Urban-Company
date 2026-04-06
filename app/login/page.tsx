import { AuthForm } from "@/components/auth/auth-form"
import { SiteShell } from "@/components/layout/site-shell"
import { Badge } from "@/components/ui/badge"

export default function LoginPage() {
  return (
    <SiteShell>
      <section className="mx-auto grid w-full max-w-5xl gap-6 lg:grid-cols-2 lg:items-center">
        <div className="space-y-4">
          <Badge variant="secondary">Welcome back</Badge>
          <h1 className="font-heading text-4xl font-semibold tracking-tight sm:text-5xl">
            Sign in and continue managing your clean-home workflow
          </h1>
          <p className="text-muted-foreground">
            Access bookings, notifications, provider tools, and account
            analytics from one streamlined portal.
          </p>
        </div>
        <AuthForm mode="login" />
      </section>
    </SiteShell>
  )
}
