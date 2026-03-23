# Neovim Configuration

Modular Neovim config using [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

## Project Structure

```
nvim/
├── init.lua              # Entry point
├── lua/
│   ├── config/
│   │   ├── lazy.lua      # Plugin manager bootstrap
│   │   └── base.lua      # Base Neovim settings
│   └── plugin/
│       ├── lsp.lua       # LSP configuration
│       ├── telescope.lua # Fuzzy finder
│       ├── lualine.lua   # Status line
│       ├── nvim-tree.lua # File explorer
│       └── others.lua    # Themes and utilities
└── lazy-lock.json        # Plugin lockfile
```

## Prerequisites

| Dependency | Purpose | Install Command |
|------------|---------|-----------------|
| `git` | Clone plugins | (pre-installed) |
| `ripgrep` | Telescope grep | `sudo apt-get install ripgrep` |
| `node` + `npm` | Language servers | OS-specific |

### Language Servers (via Mason)

| Language | Package | Install Command |
|----------|---------|-----------------|
| Lua | `lua-language-server` | Built-in |
| HTML | `vscode-langservers-extracted` | `npm i -g vscode-langservers-extracted` |
| TS/JS | `ts_ls` | Built-in |
| C/C++ | `clangd` | Built-in |

## Plugins

| Plugin | Purpose |
|--------|---------|
| lazy.nvim | Plugin manager |
| mason.nvim | LSP/DAP installer |
| nvim-lspconfig | LSP configuration |
| nvim-cmp + LuaSnip | Completion |
| telescope.nvim | Fuzzy finder |
| nvim-treesitter | Syntax highlighting |
| nvim-tree.lua | File explorer |
| Themes: onedark, gruvbox, tokyonight, nordic | Color schemes |

## Installation

```bash
git clone https://your-repo/neovim-config.git ~/.config/nvim
sudo apt-get install ripgrep
npm i -g vscode-langservers-extracted typescript typescript-language-server
nvim  # Plugins auto-install on first run
```

## Key Mappings

| Mapping | Action |
|---------|--------|
| `gd` | Go to definition |
| `K` | Hover docs |
| `<space>rn` | Rename |
| `<space>ca` | Code actions |
| `<space>f` | Format |

## Troubleshooting

### Telescope grep not working

```bash
sudo apt-get install ripgrep
```

### Mason LSP install fails

```bash
npm i -g vscode-langservers-extracted typescript typescript-language-server
```
