import * as React from "react"
import { cva, type VariantProps } from "class-variance-authority"

import { cn } from "@/lib/utils"

const inputGroupVariants = cva(
  "flex w-full items-stretch overflow-hidden rounded-md border border-input focus-within:ring-1 focus-within:ring-ring",
  {
    variants: {
      size: {
        default: "h-10",
        sm: "h-9",
        lg: "h-11",
      },
    },
    defaultVariants: {
      size: "default",
    },
  }
)

interface InputGroupProps
  extends React.HTMLAttributes<HTMLDivElement>,
    VariantProps<typeof inputGroupVariants> {}

const InputGroup = React.forwardRef<HTMLDivElement, InputGroupProps>(
  ({ className, size, ...props }, ref) => {
    return (
      <div
        ref={ref}
        className={cn(inputGroupVariants({ size }), className)}
        {...props}
      />
    )
  }
)
InputGroup.displayName = "InputGroup"

const InputGroupText = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => {
  return (
    <div
      ref={ref}
      className={cn(
        "flex items-center border-input bg-muted px-3 text-sm text-muted-foreground",
        "border-r last:border-r-0 first:border-l first:border-r-0",
        className
      )}
      {...props}
    />
  )
})
InputGroupText.displayName = "InputGroupText"

export { InputGroup, InputGroupText }