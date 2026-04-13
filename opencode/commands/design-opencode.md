---
description: Designs or adjusts your OpenCode setup without unnecessary noise
agent: orchestrator
---

Design or update this OpenCode setup using `$ARGUMENTS` as the initial brief.

Workflow:
1. Inspect `~/.config/opencode`, `agents/`, `commands/`, `skills/`, and `opencode.jsonc` first.
2. Determine whether the change needs agents, commands, skills, plugins, or permissions.
3. Ask only the clarifications that materially change architecture or risk.
4. Prefer short names, minimal permissions, and less overlap between agents.
5. If something reusable already exists, extend it instead of duplicating it.
6. Present a summary of the proposal before editing if the change is broad.
7. At the end, summarize created or changed files and the workflow they enable.
