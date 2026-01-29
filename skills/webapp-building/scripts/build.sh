#!/bin/bash

set -e

PROJECT_DIR="../../../../app"

if [ ! -d "$PROJECT_DIR" ]; then
    echo "Error: Project not found at $PROJECT_DIR"
    echo "Please run init-webapp.sh first"
    exit 1
fi

cd "$PROJECT_DIR"

echo "Building project..."

if ! command -v npm &> /dev/null; then
    echo "Error: npm not found"
    exit 1
fi

# 检查 node_modules
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies..."
    npm install --silent
fi

# 构建
npm run build

if [ $? -eq 0 ]; then
    echo ""
    echo "✓ Build successful"
    echo "Output: $PROJECT_DIR/dist/"
    echo ""
    ls -lh dist/
else
    echo "✗ Build failed"
    exit 1
fi