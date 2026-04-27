-- Editor chrome: everything that paints Neovim's own UI.
-- Syntax / Treesitter / LSP / plugin groups live in sibling files.
--
-- Design rules (from the RBR style guide):
--   kerb_red     → exactly one "active/selected" thing on screen
--   rb_yellow    → urgency: cursor, warnings, current-line-number accent
--   other colors → pastel support cast, must not steal attention

local M = {}

function M.get(ctx)
  local p, bg = ctx.p, ctx.bg

  return {
    -- ----- Core buffer -----
    Normal       = { fg = p.text,      bg = bg(p.base)    },
    NormalNC     = { fg = p.subtext1,  bg = bg(p.mantle)  },
    NormalFloat  = { fg = p.text,      bg = bg(p.surface0)},
    FloatBorder  = { fg = p.overlay1,  bg = bg(p.surface0)},
    FloatTitle   = { fg = p.kerb_red,  bg = bg(p.surface0), bold = true },
    EndOfBuffer  = { fg = p.base,      bg = bg(p.base)    },

    -- ----- Cursor & line -----
    Cursor        = { fg = p.base,     bg = p.rb_yellow  },
    lCursor       = { fg = p.base,     bg = p.rb_yellow  },
    CursorIM      = { fg = p.base,     bg = p.rb_yellow  },
    TermCursor    = { fg = p.base,     bg = p.rb_yellow  },
    CursorLine    = { bg = p.surface1 },
    CursorColumn  = { bg = p.surface1 },
    CursorLineNr  = { fg = p.kerb_red, bold = true },
    LineNr        = { fg = p.overlay0 },
    LineNrAbove   = { fg = p.overlay0 },
    LineNrBelow   = { fg = p.overlay0 },
    SignColumn    = { fg = p.overlay0, bg = bg(p.base) },
    ColorColumn   = { bg = p.surface1 },

    -- ----- Selection & search -----
    Visual        = { bg = p.surface2 },
    VisualNOS     = { bg = p.surface1 },
    Search        = { fg = p.base,  bg = p.rb_yellow },
    CurSearch     = { fg = p.base,  bg = p.rb_warm   },
    IncSearch     = { fg = p.base,  bg = p.rb_yellow },
    Substitute    = { fg = p.base,  bg = p.kerb_bright },
    MatchParen    = { fg = p.kerb_red, bold = true },

    -- ----- Windows & splits -----
    WinSeparator  = { fg = p.overlay0 },
    VertSplit     = { fg = p.overlay0 },
    WinBar        = { fg = p.subtext1, bg = bg(p.base) },
    WinBarNC      = { fg = p.subtext0, bg = bg(p.base) },

    -- ----- Status / tab line -----
    StatusLine    = { fg = p.text,     bg = p.surface1 },
    StatusLineNC  = { fg = p.subtext1, bg = p.mantle   },
    TabLine       = { fg = p.subtext1, bg = p.mantle   },
    TabLineSel    = { fg = p.text,     bg = p.surface2, bold = true },
    TabLineFill   = { bg = p.mantle },

    -- ----- Popup menu -----
    Pmenu         = { fg = p.text,     bg = p.surface0 },
    PmenuSel      = { fg = p.base,     bg = p.kerb_red, bold = true },
    PmenuSbar     = { bg = p.surface1 },
    PmenuThumb    = { bg = p.overlay0 },
    PmenuKind     = { fg = p.rb_yellow,  bg = p.surface0 },
    PmenuKindSel  = { fg = p.base,       bg = p.kerb_red, bold = true },
    PmenuExtra    = { fg = p.subtext1,   bg = p.surface0 },
    PmenuExtraSel = { fg = p.base,       bg = p.kerb_red },

    -- ----- Messages -----
    MsgArea      = { fg = p.text,           bg = bg(p.base) },
    MsgSeparator = { fg = p.overlay0,       bg = p.surface0 },
    ModeMsg      = { fg = p.paddock_green,  bold = true },
    MoreMsg      = { fg = p.oracle_blue },
    ErrorMsg     = { fg = p.kerb_bright,    bold = true },
    WarningMsg   = { fg = p.rb_yellow,      bold = true },
    Question     = { fg = p.oracle_blue },

    -- ----- Directories / titles -----
    Directory    = { fg = p.sky_blue },
    Title        = { fg = p.kerb_red, bold = true },

    -- ----- Folds -----
    Folded       = { fg = p.subtext1, bg = p.surface0 },
    FoldColumn   = { fg = p.overlay0 },

    -- ----- Diff (legacy `:diff` mode; gitsigns overrides these) -----
    -- The background tints are hand-mixed: surface1 + accent @ ~15% to stay readable.
    DiffAdd      = { bg = "#1a2a25" },  -- surface1 × paddock_green
    DiffChange   = { bg = "#2b2619" },  -- surface1 × rb_warm
    DiffDelete   = { bg = "#2b151c",  fg = p.kerb_bright },
    DiffText     = { bg = "#3d3214",  bold = true },

    -- ----- Spell -----
    SpellBad     = { sp = p.kerb_bright,  undercurl = true },
    SpellCap     = { sp = p.rb_yellow,    undercurl = true },
    SpellLocal   = { sp = p.oracle_blue,  undercurl = true },
    SpellRare    = { sp = p.light_grey, undercurl = true },

    -- ----- Nonprintable / concealment -----
    NonText      = { fg = p.overlay0 },
    Whitespace   = { fg = p.overlay0 },
    SpecialKey   = { fg = p.overlay0 },
    Conceal      = { fg = p.overlay1 },

    -- ----- Quickfix / location list -----
    qfLineNr     = { fg = p.subtext1 },
    qfFileName   = { fg = p.sky_blue },
    QuickFixLine = { bg = p.surface1, bold = true },
  }
end

return M
