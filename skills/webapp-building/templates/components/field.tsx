import * as React from "react"
import { cva, type VariantProps } from "class-variance-authority"

import { cn } from "@/lib/utils"
import { Label } from "@/components/ui/label"

const fieldVariants = cva("space-y-2", {
  variants: {
    size: {
      default: "",
      sm: "space-y-1",
      lg: "space-y-3",
    },
  },
  defaultVariants: {
    size: "default",
  },
})

interface FieldProps
  extends React.HTMLAttributes<HTMLDivElement>,
    VariantProps<typeof fieldVariants> {
  label?: string
  description?: string
  error?: string
  htmlFor?: string
}

const Field = React.forwardRef<HTMLDivElement, FieldProps>(
  ({ className, size, label, description, error, htmlFor, children, ...props }, ref) => {
    return (
      <div ref={ref} className={cn(fieldVariants({ size }), className)} {...props}>
        {label && <Label htmlFor={htmlFor}>{label}</Label>}
        {children}
        {description && !error && (
          <p className="text-sm text-muted-foreground">{description}</p>
        )}
        {error && <p className="text-sm font-medium text-destructive">{error}</p>}
      </div>
    )
  }
)
Field.displayName = "Field"

export { Field }