#!/bin/bash

set -e

COMPONENT_NAME=$1
PROJECT_DIR="../../../../app"
UI_DIR="$PROJECT_DIR/src/components/ui"
TEMPLATE_DIR="$(dirname "$0")/../templates/components"

if [ -z "$COMPONENT_NAME" ]; then
    echo "Error: Component name is required"
    echo "Usage: add-component.sh <component-name>"
    echo ""
    echo "Available components:"
    echo "  accordion, alert-dialog, alert, aspect-ratio, avatar, badge, breadcrumb,"
    echo "  button, calendar, card, carousel, chart, checkbox, collapsible, command,"
    echo "  context-menu, dialog, drawer, dropdown-menu, form, hover-card, input,"
    echo "  input-otp, label, menubar, navigation-menu, pagination, popover, progress,"
    echo "  radio-group, resizable, scroll-area, select, separator, sheet, skeleton,"
    echo "  slider, sonner, switch, table, tabs, textarea, toggle, toggle-group, tooltip"
    exit 1
fi

# 转换为小写，处理可能的驼峰命名
COMPONENT_FILE=$(echo "$COMPONENT_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/ //g')

TARGET_FILE="$UI_DIR/$COMPONENT_FILE.tsx"

if [ -f "$TARGET_FILE" ]; then
    echo "Component $COMPONENT_NAME already exists at $TARGET_FILE"
    exit 0
fi

# 检查是否有预设模板
TEMPLATE_FILE="$TEMPLATE_DIR/$COMPONENT_FILE.tsx"

if [ -f "$TEMPLATE_FILE" ]; then
    cp "$TEMPLATE_FILE" "$TARGET_FILE"
    echo "✓ Added component: $COMPONENT_FILE (from template)"
else
    # 生成基础组件模板
    CLASS_NAME=$(echo "$COMPONENT_FILE" | sed -E 's/(^|-)([a-z])/\U\2/g' | sed 's/-//g')
    
    cat > "$TARGET_FILE" << EOF
import * as React from "react"
import { cn } from "@/lib/utils"

export interface ${CLASS_NAME}Props extends React.HTMLAttributes<HTMLDivElement> {}

const ${CLASS_NAME} = React.forwardRef<HTMLDivElement, ${CLASS_NAME}Props>(
  ({ className, ...props }, ref) => {
    return (
      <div
        ref={ref}
        className={cn("", className)}
        {...props}
      />
    )
  }
)
${CLASS_NAME}.displayName = "${CLASS_NAME}"

export { ${CLASS_NAME} }
EOF
    echo "✓ Created basic component: $COMPONENT_FILE"
fi