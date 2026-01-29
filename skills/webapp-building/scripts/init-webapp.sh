#!/bin/bash

set -e

PROJECT_NAME="${1:-My App}"
OUTPUT_DIR="D:\code_info\mycode\foo1"
PROJECT_DIR="$OUTPUT_DIR/app"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$(dirname "$SCRIPT_DIR")/templates/default"

echo "Creating project: $PROJECT_DIR"

# 清理并创建目录
rm -rf "$PROJECT_DIR"
mkdir -p "$PROJECT_DIR"

# 复制模板文件
cp -r "$TEMPLATE_DIR"/* "$PROJECT_DIR/"

# 替换项目名称
sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$PROJECT_DIR/index.html"
sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$PROJECT_DIR/package.json"
sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$PROJECT_DIR/src/App.tsx"

# 创建必要的子目录
mkdir -p "$PROJECT_DIR/src/sections"
mkdir -p "$PROJECT_DIR/src/hooks"
mkdir -p "$PROJECT_DIR/src/types"

echo ""
echo "✓ Setup complete: $PROJECT_DIR"
echo ""
echo "Using Node.js 20, Tailwind CSS v3.4.19, and Vite v5.x"
echo ""
echo "Tailwind CSS has been set up with the shadcn theme"
echo ""
echo "Components (40+):"
echo "  accordion, alert-dialog, alert, aspect-ratio, avatar, badge, breadcrumb,"
echo "  button-group, button, calendar, card, carousel, chart, checkbox, collapsible,"
echo "  command, context-menu, dialog, drawer, dropdown-menu, empty, field, form,"
echo "  hover-card, input-group, input-otp, input, item, kbd, label, menubar,"
echo "  navigation-menu, pagination, popover, progress, radio-group, resizable,"
echo "  scroll-area, select, separator, sheet, sidebar, skeleton, slider, sonner,"
echo "  spinner, switch, table, tabs, textarea, toggle-group, toggle, tooltip"
echo ""
echo "Usage:"
echo "  import { Button } from '@/components/ui/button'"
echo "  import { Card, CardHeader, CardTitle } from '@/components/ui/card'"
echo ""
echo "Structure:"
echo "  src/sections/        Page sections"
echo "  src/hooks/           Custom hooks"
echo "  src/types/           Type definitions"
echo "  src/App.css          Styles specific to the Webapp"
echo "  src/App.tsx          Root React component"
echo "  src/index.css        Global styles"
echo "  src/main.tsx         Entry point for rendering the Webapp"
echo "  index.html           Entry point for the Webapp"
echo "  tailwind.config.js   Configures Tailwind's theme, plugins, etc."
echo "  vite.config.ts       Main build and dev server settings for Vite"
echo "  postcss.config.js    Config file for CSS post-processing tools"
echo ""

# 安装依赖
if command -v npm &> /dev/null; then
    echo "Installing dependencies..."
    cd "$PROJECT_DIR"
    npm install --silent
    echo "✓ Dependencies installed"
else
    echo "! npm not found. Please run 'npm install' manually."
fi