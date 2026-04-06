import { AuthForm } from "@/components/auth/auth-form"
import { SiteShell } from "@/components/layout/site-shell"
import { Badge } from "@/components/ui/badge"

export default function RegisterPage() {
  return (
    <SiteShell>
      <section className="mx-auto grid w-full max-w-5xl gap-6 lg:grid-cols-2 lg:items-center">
        <div className="space-y-4">
          <Badge variant="secondary">Get started</Badge>
          <h1 className="font-heading text-4xl font-semibold tracking-tight sm:text-5xl">
            Create your Urban Clean account in under a minute
          </h1>
          <p className="text-muted-foreground">
            Join as a customer to book services or as a provider to publish your
            offerings and manage bookings.
          </p>
        </div>
        <AuthForm mode="register" />
      </section>
    </SiteShell>
  )
}
