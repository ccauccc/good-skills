#!/bin/bash

set -e

PROJECT_DIR="../../../../app"

if [ ! -d "$PROJECT_DIR/dist" ]; then
    echo "Error: Build output not found"
    echo "Please run build.sh first"
    exit 1
fi

cd "$PROJECT_DIR"

echo "Starting preview server..."

# 使用 Python 简单 HTTP 服务器（或其他可用服务器）
if command -v python3 &> /dev/null; then
    python3 -m http.server 4173 --directory dist &
    SERVER_PID=$!
    echo "Preview server running at http://localhost:4173"
    echo "PID: $SERVER_PID"
elif command -v npx &> /dev/null; then
    npx serve -s dist -l 4173 &
    SERVER_PID=$!
    echo "Preview server running at http://localhost:4173"
else
    echo "Error: No suitable server found"
    exit 1
fi

# 保持脚本运行
wait $SERVER_PID