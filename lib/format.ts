export function toNumber(value: unknown): number {
  if (typeof value === "number" && Number.isFinite(value)) {
    return value
  }

  if (typeof value === "string") {
    const parsed = Number(value)
    return Number.isFinite(parsed) ? parsed : 0
  }

  if (value && typeof value === "object" && "toString" in value) {
    const parsed = Number(String(value))
    return Number.isFinite(parsed) ? parsed : 0
  }

  return 0
}

export function formatCurrencyINR(value: unknown): string {
  const amount = toNumber(value)
  return amount.toFixed(2)
}
