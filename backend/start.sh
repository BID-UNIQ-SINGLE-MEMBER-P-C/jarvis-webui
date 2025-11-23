#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR" || exit

# Enable Tool System
export ENABLE_AUTO_TOOL_CHOICE=true
export ENABLE_TOOL_CALL_PARSER=true
export ENABLE_WEB_SEARCH=true
export ENABLE_BROWSER=true

PORT="${PORT:-8080}"
HOST="${HOST:-0.0.0.0}"

echo "Starting OpenWebUI with TOOL SYSTEM enabled..."

exec python3 -m uvicorn open_webui.main:app \
    --host "$HOST" \
    --port "$PORT" \
    --forwarded-allow-ips '*' \
    --workers "${UVICORN_WORKERS:-1}"
