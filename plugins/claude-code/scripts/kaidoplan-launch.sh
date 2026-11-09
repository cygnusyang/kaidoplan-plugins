#!/usr/bin/env sh
# kaidoplan-launch.sh — zero-config launcher for the KaidoPlan MCP server.
#
# Resolution order:
#   1. $KAIDOPLAN_MCP_BIN (explicit override)
#   2. kaidoplan-mcp on PATH (Homebrew: brew install cygnusyang/kaidoplan/kaidoplan-cli)
#
# No App-bundle or source-tree fallbacks: strangers install the CLI via Homebrew
# and never need a checkout of the KaidoPlan source.
#
# Extra argv is forwarded unchanged (currently unused; MCP is stdio with no flags).

set -eu

if [ -n "${KAIDOPLAN_MCP_BIN:-}" ]; then
  BIN="$KAIDOPLAN_MCP_BIN"
elif command -v kaidoplan-mcp >/dev/null 2>&1; then
  BIN="$(command -v kaidoplan-mcp)"
else
  echo "kaidoplan-launch: kaidoplan-mcp not found." >&2
  echo "Install with: brew install cygnusyang/kaidoplan/kaidoplan-cli" >&2
  echo "Or set KAIDOPLAN_MCP_BIN to the binary path." >&2
  exit 1
fi

if [ ! -x "$BIN" ]; then
  echo "kaidoplan-launch: not executable: $BIN" >&2
  exit 1
fi

exec "$BIN" "$@"
