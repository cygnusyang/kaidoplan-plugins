# KaidoPlan plugins

Distribution repository for [KaidoPlan](https://ai.cygnusyang.top/kaidoplan/) plugins that wire the
local **kaidoplan** planning engine into AI coding tools.

This repository contains **only** plugin manifests, slash commands, hooks, and launcher scripts. It
contains no application source code. KaidoPlan itself is proprietary software; install the app and
CLI from the [homepage](https://ai.cygnusyang.top/kaidoplan/) or Homebrew.

The MCP server exposes **21 tools** (WBS, schedule, critical path, violations, status write-back,
baselines, and more). The same surface is available from the CLI and the macOS app.

## Claude Code plugin

```bash
claude plugin marketplace add cygnusyang/kaidoplan-plugins
claude plugin install kaidoplan@kaidoplan
```

When enabled, `claude mcp list` shows `kaidoplan: … - ✔ Connected` and the `mcp__kaidoplan__*` tools
become available in every session.

Zero per-user path configuration: the launcher resolves `kaidoplan-mcp` from your PATH (Homebrew) at
connect time, so you never point the plugin at a source checkout.

### Prerequisites

1. **macOS** with the KaidoPlan CLI / MCP binary installed:

   ```bash
   brew install cygnusyang/kaidoplan/kaidoplan-cli
   ```

   (Optional but recommended: also install the app with
   `brew install --cask cygnusyang/kaidoplan/kaidoplan`.)

2. Point sessions at a project file when you want write-back / hooks:

   ```bash
   export KAIDOPLAN_PROJECT=/path/to/your.kaido
   ```

### Alternative: App 「Copy MCP config」

If you prefer not to use the Claude Code marketplace, open the KaidoPlan macOS app → MCP panel →
**Copy MCP config**, then paste the JSON into your client's `mcpServers` (or merge the Codex TOML
snippet into `~/.codex/config.toml`). That path registers the same **21** tools without this plugin
repo; slash commands and the TaskCompleted hook come only from the plugin above.

### What's inside

| Path | Purpose |
|---|---|
| `.claude-plugin/marketplace.json` | Marketplace manifest (points at `plugins/claude-code`) |
| `plugins/claude-code/.claude-plugin/plugin.json` | Plugin manifest |
| `plugins/claude-code/.mcp.json` | Declares the stdio MCP server |
| `plugins/claude-code/scripts/kaidoplan-launch.sh` | MCP launcher — finds `kaidoplan-mcp` on PATH / `KAIDOPLAN_MCP_BIN` |
| `plugins/claude-code/bin/kaidoplan-task-hook*` | TaskCompleted hook → mark matching KaidoPlan task done |
| `plugins/claude-code/commands/*.md` | `/kaidoplan plan`, `/kaidoplan done`, `/kaidoplan status` |

## Status

Early (plugin version 0.1.0). Manifests may change between releases; pin to a tag if you depend on a
specific shape.

## License

Proprietary. See [LICENSE.md](LICENSE.md). The plugin is provided for installation and use with the
KaidoPlan application; redistribution and derivative distribution are not permitted.
