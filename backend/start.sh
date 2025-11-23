#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR" || exit

PORT="${PORT:-8080}"
HOST="${HOST:-0.0.0.0}"

echo "Starting OpenWebUI with native CLI (tools enabled)..."

exec python3 -m open_webui.cli.main \
    --host "$HOST" \
    --port "$PORT" \
    --enable-auto-tool-choice \
    --tool-call-parser \
    --enable-web-search \
    --enable-browser
