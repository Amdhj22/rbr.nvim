-- Traditional (pre-treesitter) syntax groups.
-- These still matter for:
--   * filetypes without a tree-sitter parser installed,
--   * plugins that set `syntax/*.vim` groups directly,
--   * built-in help / man pages.
--
-- Mapping rules (see rbr-theme STYLE-GUIDE.md):
--   Keywords / control flow → kerb_red      ("verbs" of code)
--   Types / Structures      → rb_yellow     (declarations earn attention)
--   Strings                 → paddock_green (data reads calmly)
--   Numbers / constants     → light_grey / cool_grey
--   Functions               → oracle_blue   (named operations)
--   Comments                → subtext0 italic

local M = {}

function M.get(ctx)
  local p = ctx.p
  local italic = ctx.c.italic_comments

  return {
    Comment        = { fg = p.subtext0, italic = italic },

    Constant       = { fg = p.cool_grey },
    String         = { fg = p.paddock_green },
    Character      = { fg = p.paddock_green },
    Number         = { fg = p.light_grey },
    Boolean        = { fg = p.light_grey },
    Float          = { fg = p.light_grey },

    Identifier     = { fg = p.text },
    Function       = { fg = p.chequer_white },

    Statement      = { fg = p.kerb_red },
    Conditional    = { fg = p.kerb_red },
    Repeat         = { fg = p.kerb_red },
    Label          = { fg = p.oracle_blue },
    Operator       = { fg = p.subtext1 },
    Keyword        = { fg = p.kerb_red },
    Exception      = { fg = p.kerb_red },

    PreProc        = { fg = p.sky_blue },
    Include        = { fg = p.kerb_red },
    Define         = { fg = p.sky_blue },
    Macro          = { fg = p.sky_blue },
    PreCondit      = { fg = p.sky_blue },

    Type           = { fg = p.rb_yellow },
    StorageClass   = { fg = p.rb_yellow },
    Structure      = { fg = p.rb_yellow },
    Typedef        = { fg = p.rb_yellow },

    Special        = { fg = p.sky_blue },
    SpecialChar    = { fg = p.sky_blue },
    Tag            = { fg = p.teal },
    Delimiter      = { fg = p.subtext1 },
    SpecialComment = { fg = p.subtext0, italic = italic, bold = true },
    Debug          = { fg = p.light_grey },

    Underlined     = { underline = true },
    Ignore         = { fg = p.overlay0 },
    Error          = { fg = p.kerb_bright, bold = true },
    Todo           = { fg = p.rb_yellow, bg = p.surface1, bold = true },
  }
end

return M
