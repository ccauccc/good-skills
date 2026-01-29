import * as React from "react"
import { cva, type VariantProps } from "class-variance-authority"

import { cn } from "@/lib/utils"

const buttonGroupVariants = cva("inline-flex", {
  variants: {
    variant: {
      default: "border rounded-md overflow-hidden [&>button]:rounded-none [&>button]:border-0 [&>button]:border-r [&>button:last-child]:border-0",
      outline: "border rounded-md overflow-hidden [&>button]:rounded-none [&>button]:border-0 [&>button]:border-r [&>button:last-child]:border-0",
      ghost: "[&>button]:rounded-none",
    },
    size: {
      default: "[&>button]:h-10 [&>button]:px-4",
      sm: "[&>button]:h-9 [&>button]:px-3",
      lg: "[&>button]:h-11 [&>button]:px-8",
    },
  },
  defaultVariants: {
    variant: "default",
    size: "default",
  },
})

interface ButtonGroupProps extends React.HTMLAttributes<HTMLDivElement>, VariantProps<typeof buttonGroupVariants> {}

const ButtonGroup = React.forwardRef<HTMLDivElement, ButtonGroupProps>(
  ({ className, variant, size, ...props }, ref) => {
    return (
      <div
        ref={ref}
        className={cn(buttonGroupVariants({ variant, size }), className)}
        {...props}
      />
    )
  }
)
ButtonGroup.displayName = "ButtonGroup"

export { ButtonGroup, buttonGroupVariants }