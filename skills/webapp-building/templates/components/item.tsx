import * as React from "react"
import { Check } from "lucide-react"

import { cn } from "@/lib/utils"

interface ItemProps extends React.HTMLAttributes<HTMLDivElement> {
  selected?: boolean
  icon?: React.ReactNode
  title: string
  description?: string
  action?: React.ReactNode
}

const Item = React.forwardRef<HTMLDivElement, ItemProps>(
  ({ className, selected, icon, title, description, action, children, ...props }, ref) => {
    return (
      <div
        ref={ref}
        className={cn(
          "flex items-center gap-3 rounded-md border p-3 transition-colors",
          "hover:bg-accent/50",
          selected && "border-primary bg-accent",
          className
        )}
        {...props}
      >
        {icon && (
          <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-md bg-muted">
            {icon}
          </div>
        )}
        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2">
            <h4 className="text-sm font-medium truncate">{title}</h4>
            {selected && <Check className="h-4 w-4 text-primary shrink-0" />}
          </div>
          {description && (
            <p className="text-xs text-muted-foreground line-clamp-1">
              {description}
            </p>
          )}
          {children}
        </div>
        {action && <div className="shrink-0">{action}</div>}
      </div>
    )
  }
)
Item.displayName = "Item"

export { Item }