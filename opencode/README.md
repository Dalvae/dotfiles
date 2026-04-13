# OpenCode Configuration

This directory contains my OpenCode configuration files.

## Files

- `opencode.jsonc`: Main OpenCode configuration with model settings, plugins, and agents
- `tui.json`: Terminal UI keybindings
- `package.json`: Node.js dependencies for OpenCode plugins
- `plugin/`: Custom plugins directory

## Setup

After running the main install script, navigate to `~/.config/opencode` and run:

```bash
npm install
```

This will install all required dependencies for OpenCode plugins.

## Custom Agents

This configuration includes these OpenCode agents:

- **build**: Primary implementation agent (openai/gpt-5.4-mini) with controlled delegation
- **plan**: Planning specialist for creating and tracking plans (openai/gpt-5.4)
- **fast**: Small tasks with minimal context (Gemini 3 flash preview)
- **debug**: Deep debugging and root-cause analysis
- **general**: Complex research and multi-step work
- **explore**: Fast read-only repository explorer

## Plugins

- `@mohak34/opencode-notifier`: Desktop notifications
- `opencode-sessions`: Session management
- `@tarquinen/opencode-dcp`: Deep context protocol
- `superpowers`: local utility plugin

## MCP Servers

- **context7**: Documentation lookup
- **gh_grep**: GitHub code search
- **playwright**: Browser automation (disabled by default)
