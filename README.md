<h1 align="center">
  🏁&nbsp;&nbsp;rbr.nvim
</h1>

<p align="center">
  <i>A Red Bull Racing colorscheme for Neovim — the Neovim port of <a href="https://github.com/Amdhj22/rbr">rbr-theme</a>.</i>
</p>

<p align="center">
  <a href="https://github.com/Amdhj22/rbr.nvim/stargazers"><img src="https://img.shields.io/github/stars/Amdhj22/rbr.nvim?colorA=0a1128&colorB=e84a55&style=for-the-badge"/></a>
  <a href="./LICENSE"><img src="https://img.shields.io/github/license/Amdhj22/rbr.nvim?colorA=0a1128&colorB=b8d49e&style=for-the-badge"/></a>
  <a href="https://github.com/Amdhj22/rbr"><img src="https://img.shields.io/badge/palette-rbr--theme-e84a55?colorA=0a1128&style=for-the-badge"/></a>
</p>

&nbsp;

## About

`rbr.nvim` paints Neovim with the [RBR color scheme](https://github.com/Amdhj22/rbr) — a **three-accent** palette: **kerb red** for what's active, **RB yellow** for what needs attention, **pure white** for functions / methods (the third dominant color in any code buffer). Everything else steps back in pastel. Colors live upstream in `rbr-theme`'s `palette.json` and are vendored here as a single Lua table.

> [!NOTE]
> This scheme is a fan tribute. Not affiliated with or endorsed by Red Bull Racing, Oracle Red Bull Racing, or Red Bull GmbH.

&nbsp;

## Requirements

- Neovim **0.8+** (for `vim.api.nvim_set_hl`)
- A true-color terminal with `termguicolors = true`

&nbsp;

## Install

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "Amdhj22/rbr.nvim",
  lazy = false,      -- load during startup so colors are ready immediately
  priority = 1000,   -- load before other plugins that depend on highlights
  opts = {},
  config = function(_, opts)
    require("rbr").setup(opts)
    vim.cmd.colorscheme("rbr")
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use({
  "Amdhj22/rbr.nvim",
  config = function()
    require("rbr").setup()
    vim.cmd.colorscheme("rbr")
  end,
})
```

&nbsp;

## Configuration

All options with defaults:

```lua
require("rbr").setup({
  flavor          = "classic",   -- only flavor for now
  transparent     = false,       -- set Normal bg to NONE
  italic_comments = true,

  integrations = {
    -- core (stock Neovim)
    syntax     = true,
    treesitter = true,
    lsp        = true,

    -- plugins (opt-in)
    gitsigns     = false,
    telescope    = false,
    ["nvim-tree"] = false,
    cmp          = false,
    which_key    = false,
  },
})

vim.cmd.colorscheme("rbr")
```

### Transparent background

If your terminal renders a transparent / blurred background (Ghostty, iTerm2, kitty, …), set `transparent = true` so `Normal` and related groups paint with `bg = NONE` and the terminal's background shows through:

```lua
require("rbr").setup({ transparent = true })
vim.cmd.colorscheme("rbr")
```

Cursor line, selection, status line, and pmenu keep their backgrounds on purpose — the brand still needs visible chrome.

&nbsp;

## Palette

See the upstream [style guide](https://github.com/Amdhj22/rbr/blob/main/STYLE-GUIDE.md) for color semantics and the canonical ANSI mapping. `rbr.nvim` follows it exactly.

&nbsp;

## lualine

`rbr.nvim` ships a [lualine](https://github.com/nvim-lualine/lualine.nvim) theme. No integration flag needed — lualine auto-discovers it at `lua/lualine/themes/rbr.lua`:

```lua
require("lualine").setup({
  options = { theme = "rbr" },
})
```

Each Vim mode gets a distinct accent: `normal` → Kerb Red, `insert` → Paddock Green, `visual` → RB Yellow, `replace` → Kerb Bright, `command` → Oracle Blue, `terminal` → Crowd Orange.

&nbsp;

## Status

Currently implemented:

- ✅ Editor chrome (Normal, Cursor, Visual, StatusLine, Pmenu, …)
- ✅ Syntax groups (pre-treesitter fallback)
- ✅ Treesitter `@captures` (incl. markdown)
- ✅ LSP — `Diagnostic*`, `LspReference*`, `LspInlayHint`, and semantic tokens (`@lsp.type.*` / `@lsp.mod.*`)
- ✅ `:terminal` ANSI colors
- ✅ [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) (opt-in)
- ✅ [lualine](https://github.com/nvim-lualine/lualine.nvim) theme
- 🚧 telescope, nvim-tree, nvim-cmp, which-key (planned)

&nbsp;

## License

[MIT](./LICENSE) © Amdhj22
