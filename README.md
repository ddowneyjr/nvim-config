generated with claude code

# Neovim Configuration

A modern Neovim setup using lazy.nvim with LSP, autocompletion, and Salesforce development support.

## Structure

```
~/.config/nvim/
├── init.lua
├── lua/
│   ├── config/
│   │   └── lazy.lua        # Bootstrap + editor settings
│   └── plugins/            # Plugin configurations
```

## Editor Settings

| Setting | Value |
|---------|-------|
| Leader | `<Space>` |
| Local Leader | `\` |
| Tab Width | 2 spaces |
| Line Numbers | Relative |
| Clipboard | System clipboard |

## Plugins

| Plugin | Purpose |
|--------|---------|
| **lazy.nvim** | Plugin manager |
| **mason.nvim** | LSP/formatter installer |
| **nvim-lspconfig** | LSP configuration |
| **nvim-cmp** | Autocompletion engine |
| **LuaSnip** | Snippet engine |
| **nvim-autopairs** | Auto-close brackets/quotes |
| **telescope.nvim** | Fuzzy finder |
| **oil.nvim** | Floating file browser |
| **neo-tree.nvim** | Project tree sidebar |
| **nvim-treesitter** | Syntax highlighting |
| **conform.nvim** | Code formatting |
| **gitsigns.nvim** | Git indicators in gutter |
| **lazygit.nvim** | Git UI |
| **gruvbox.nvim** | Colorscheme |
| **lualine.nvim** | Status bar |
| **which-key.nvim** | Keybind hints |
| **indent-blankline.nvim** | Indent guides |
| **rustaceanvim** | Rust tooling |
| **sf.nvim** | Salesforce development |
| **claudecode.nvim** | Claude AI integration |

## Language Servers

Installed via Mason:
- **lua_ls** - Lua
- **ts_ls** - TypeScript/JavaScript
- **html** - HTML
- **cssls** - CSS
- **basedpyright** - Python
- **clangd** - C/C++
- **jdtls** - Java
- **apex_ls** - Salesforce Apex
- **rust-analyzer** - Rust (via rustaceanvim)

## Keybindings

### General

| Key | Mode | Action |
|-----|------|--------|
| `jk` | Insert | Exit to normal mode |
| `<C-h>` | Normal | Window left |
| `<C-j>` | Normal | Window down |
| `<C-k>` | Normal | Window up |
| `<C-l>` | Normal | Window right |

### LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Hover documentation |
| `gr` | List references |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>d` | Show diagnostic float |

### Completion (nvim-cmp)

| Key | Action |
|-----|--------|
| `<Tab>` | Next item |
| `<S-Tab>` | Previous item |
| `<CR>` | Confirm selection |
| `<C-Space>` | Trigger completion |
| `<C-e>` | Abort completion |
| `<C-b>` | Scroll docs up |
| `<C-f>` | Scroll docs down |

### File Navigation

| Key | Action |
|-----|--------|
| `-` | Toggle oil.nvim (float) |
| `<leader>ee` | Neo-tree filesystem |
| `<leader>bf` | Neo-tree buffers |

### Telescope

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | List buffers |

### Git (gitsigns)

| Key | Action |
|-----|--------|
| `]c` | Next hunk |
| `[c` | Previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |

### Formatting

| Key | Action |
|-----|--------|
| `<leader>f` | Format buffer |

### Git UI

| Key | Action |
|-----|--------|
| `<leader>gg` | Open LazyGit |

### Salesforce (sf.nvim)

| Key | Action |
|-----|--------|
| `<leader>so` | Set target org |
| `<leader>sl` | Refresh/list orgs |
| `<leader>sd` | Deploy current file |
| `<leader>sr` | Retrieve current file |
| `<leader>sm` | List metadata to pull |
| `<leader>ta` | Run current test |
| `<leader>tA` | Run all tests in file |

### Claude AI

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ac` | Normal | Toggle Claude Code |
| `<leader>as` | Visual | Send selection to Claude |

### Help

| Key | Action |
|-----|--------|
| `<leader>?` | Show buffer keymaps |

## Formatters

Configured via conform.nvim:

| Language | Formatter |
|----------|-----------|
| Lua | stylua |
| Python | black |
| JavaScript/TypeScript | prettier |
| HTML/CSS/JSON | prettier |
| YAML/Markdown | prettier |
| C/C++ | clang-format |
| Java | google-java-format |
| Rust | rustfmt |

## Requirements

- Neovim >= 0.9
- Git
- A Nerd Font (for icons)
- Node.js (for some LSPs)
- ripgrep (for Telescope live grep)
- lazygit (for git UI)
- SDKMAN with Java 17+ (for Apex LSP)
- Salesforce CLI (for sf.nvim)
- Claude CLI (for claudecode.nvim)
