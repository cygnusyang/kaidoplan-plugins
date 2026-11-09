# KaidoPlan for Claude Code

[Claude Code plugin](https://code.claude.com/docs/en/plugins/overview) that wires your local
[KaidoPlan](https://ai.cygnusyang.top/kaidoplan/) planner into Claude — **21 MCP tools**, slash
commands for plan / done / status, and an optional TaskCompleted hook that writes matching titles
back to the `.kaido` file.

## Install (from the public marketplace repo)

```bash
claude plugin marketplace add cygnusyang/kaidoplan-plugins
claude plugin install kaidoplan@kaidoplan
```

## Prerequisites

```bash
brew install cygnusyang/kaidoplan/kaidoplan-cli   # provides kaidoplan + kaidoplan-mcp
```

Optional: set `KAIDOPLAN_PROJECT` to your `.kaido` path so hooks and slash commands know which file
to open. Overrides: `KAIDOPLAN_MCP_BIN`, `KAIDOPLAN_CLI_BIN`.

## Commands

| Command | Role |
|---|---|
| `/kaidoplan plan <需求>` | Read requirements, build WBS, schedule, list violations |
| `/kaidoplan done <任务ID>` | Mark a task done and report group progress |
| `/kaidoplan status` | Task table, critical path, violations |

## Alternative

KaidoPlan app → MCP panel → **Copy MCP config** registers the same 21 tools without this plugin
(no slash commands / hook).
