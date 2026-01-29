#!/bin/bash

set -e

SECTION_NAME=$1
PROJECT_DIR="/mnt/okcomputer/output/app"
SECTIONS_DIR="$PROJECT_DIR/src/sections"
COMPONENTS_DIR="$(dirname "$0")/../templates/components"

if [ -z "$SECTION_NAME" ]; then
    echo "Error: Section name is required"
    echo "Usage: add-section.sh <SectionName>"
    exit 1
fi

# 转换为大驼峰命名
COMPONENT_NAME=$(echo "$SECTION_NAME" | sed -E 's/(^|-)([a-z])/\U\2/g')

FILE_PATH="$SECTIONS_DIR/$COMPONENT_NAME.tsx"

if [ -f "$FILE_PATH" ]; then
    echo "Error: Section $COMPONENT_NAME already exists"
    exit 1
fi

cat > "$FILE_PATH" << EOF
import { cn } from "@/lib/utils"

interface ${COMPONENT_NAME}Props {
  className?: string
}

export function ${COMPONENT_NAME}({ className }: ${COMPONENT_NAME}Props) {
  return (
    <section className={cn("py-16 md:py-24", className)}>
      <div className="container mx-auto px-4">
        <h2 className="text-3xl md:text-4xl font-bold text-center mb-8">
          ${SECTION_NAME}
        </h2>
        <p className="text-muted-foreground text-center max-w-2xl mx-auto">
          Add your content here...
        </p>
      </div>
    </section>
  )
}
EOF

echo "✓ Created section: src/sections/$COMPONENT_NAME.tsx"

# 自动导入到 App.tsx（如果存在）
if [ -f "$PROJECT_DIR/src/App.tsx" ]; then
    # 检查是否已导入
    if ! grep -q "import { $COMPONENT_NAME }" "$PROJECT_DIR/src/App.tsx"; then
        # 添加导入语句（在最后一个 import 之后）
        sed -i "/^import.*from/a import { $COMPONENT_NAME } from '@/sections/$COMPONENT_NAME'" "$PROJECT_DIR/src/App.tsx"
        echo "✓ Auto-imported in App.tsx"
    fi
fi