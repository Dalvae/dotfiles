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

This configuration includes several custom agents:

- **fast**: Quick responses using Gemini (read-only)
- **debug**: Deep debugging with Claude Opus 4.6
- **developer**: Full development capabilities with Claude Opus 4.6
- **inspector**: Code review and quality analysis
- **agentic**: Autonomous development with GPT-5.1
- **architect**: Technical planning and architecture
- **research**: Code exploration and analysis

## Plugins

- `@mohak34/opencode-notifier`: Desktop notifications
- `opencode-sessions`: Session management
- `@howaboua/opencode-planning-toolkit`: Planning tools
- `@tarquinen/opencode-dcp`: Deep context protocol

## MCP Servers

- **context7**: Documentation lookup
- **gh_grep**: GitHub code search
- **playwright**: Browser automation (disabled by default)
