import * as React from "react"
import { PackageOpen } from "lucide-react"

import { cn } from "@/lib/utils"

interface EmptyProps extends React.HTMLAttributes<HTMLDivElement> {
  title?: string
  description?: string
  icon?: React.ReactNode
  action?: React.ReactNode
}

const Empty = React.forwardRef<HTMLDivElement, EmptyProps>(
  ({ className, title = "No data", description, icon, action, ...props }, ref) => {
    return (
      <div
        ref={ref}
        className={cn(
          "flex min-h-[400px] flex-col items-center justify-center rounded-md border border-dashed p-8 text-center animate-in fade-in-50",
          className
        )}
        {...props}
      >
        <div className="mx-auto flex max-w-[420px] flex-col items-center justify-center text-center">
          {icon ? (
            <div className="flex h-20 w-20 items-center justify-center rounded-full bg-muted">
              {icon}
            </div>
          ) : (
            <div className="flex h-20 w-20 items-center justify-center rounded-full bg-muted">
              <PackageOpen className="h-10 w-10 text-muted-foreground" />
            </div>
          )}
          <h3 className="mt-4 text-lg font-semibold">{title}</h3>
          {description && (
            <p className="mb-4 mt-2 text-sm text-muted-foreground">{description}</p>
          )}
          {action && <div className="mt-4">{action}</div>}
        </div>
      </div>
    )
  }
)
Empty.displayName = "Empty"

export { Empty }