import { Badge } from "@/components/ui/badge"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { formatCurrencyINR } from "@/lib/format"

type ServicePreview = {
  id: string
  title: string
  category: string
  city: string
  price: number | string
  isActive: boolean
}

export function RecentServices({ services }: { services: ServicePreview[] }) {
  return (
    <div className="grid gap-3">
      {services.slice(0, 8).map((service) => (
        <Card key={service.id} className="border-border/60">
          <CardHeader className="pb-2">
            <CardTitle className="flex items-center justify-between gap-3 text-base">
              <span>{service.title}</span>
              <Badge variant={service.isActive ? "default" : "outline"}>
                {service.isActive ? "Active" : "Inactive"}
              </Badge>
            </CardTitle>
          </CardHeader>
          <CardContent className="text-sm text-muted-foreground">
            {service.category} - {service.city} - INR{" "}
            {formatCurrencyINR(service.price)}
          </CardContent>
        </Card>
      ))}
      {services.length === 0 ? (
        <Card>
          <CardContent className="text-sm text-muted-foreground">
            No services yet.
          </CardContent>
        </Card>
      ) : null}
    </div>
  )
}
