-- LSP-related highlights.
--   * Diagnostic*             — errors / warnings / info / hint / ok
--   * LspReference*           — same-symbol highlight under cursor
--   * LspInlayHint            — inline type hints
--   * @lsp.type.* / @lsp.mod.* — semantic tokens (Neovim 0.9+)
--
-- Semantic tokens have the highest highlight priority, so this file is
-- intentionally aligned with `treesitter.lua` to prevent "color shimmer"
-- the moment the LSP attaches to a buffer that is already treesitter-lit.

local M = {}

function M.get(ctx)
  local p = ctx.p
  local italic = ctx.c.italic_comments

  return {
    -- ---- Diagnostics — foreground ----
    DiagnosticError = { fg = p.kerb_bright },
    DiagnosticWarn  = { fg = p.rb_yellow },
    DiagnosticInfo  = { fg = p.oracle_blue },
    DiagnosticHint  = { fg = p.pit_light },
    DiagnosticOk    = { fg = p.paddock_green },

    -- ---- Diagnostics — virtual text (tinted surface0) ----
    DiagnosticVirtualTextError = { fg = p.kerb_bright,   bg = p.surface0 },
    DiagnosticVirtualTextWarn  = { fg = p.rb_yellow,     bg = p.surface0 },
    DiagnosticVirtualTextInfo  = { fg = p.oracle_blue,   bg = p.surface0 },
    DiagnosticVirtualTextHint  = { fg = p.pit_light,     bg = p.surface0 },
    DiagnosticVirtualTextOk    = { fg = p.paddock_green, bg = p.surface0 },

    -- ---- Diagnostics — underline ----
    DiagnosticUnderlineError = { sp = p.kerb_bright,   undercurl = true },
    DiagnosticUnderlineWarn  = { sp = p.rb_yellow,     undercurl = true },
    DiagnosticUnderlineInfo  = { sp = p.oracle_blue,   undercurl = true },
    DiagnosticUnderlineHint  = { sp = p.pit_light,     undercurl = true },
    DiagnosticUnderlineOk    = { sp = p.paddock_green, undercurl = true },

    -- ---- Diagnostics — sign column ----
    DiagnosticSignError = { fg = p.kerb_bright },
    DiagnosticSignWarn  = { fg = p.rb_yellow },
    DiagnosticSignInfo  = { fg = p.oracle_blue },
    DiagnosticSignHint  = { fg = p.pit_light },
    DiagnosticSignOk    = { fg = p.paddock_green },

    -- ---- Diagnostics — floating windows ----
    DiagnosticFloatingError = { fg = p.kerb_bright },
    DiagnosticFloatingWarn  = { fg = p.rb_yellow },
    DiagnosticFloatingInfo  = { fg = p.oracle_blue },
    DiagnosticFloatingHint  = { fg = p.pit_light },
    DiagnosticFloatingOk    = { fg = p.paddock_green },

    -- ---- Diagnostics — misc ----
    DiagnosticDeprecated  = { fg = p.subtext0, strikethrough = true },
    DiagnosticUnnecessary = { fg = p.subtext0 },

    -- ---- References / inlay hints / code lens ----
    LspReferenceText            = { bg = p.surface1 },
    LspReferenceRead            = { bg = p.surface1 },
    LspReferenceWrite           = { bg = p.surface2 },
    LspSignatureActiveParameter = { fg = p.rb_yellow, bold = true },
    LspInlayHint                = { fg = p.subtext0, bg = p.surface0, italic = italic },
    LspCodeLens                 = { fg = p.subtext1, italic = italic },
    LspCodeLensSeparator        = { fg = p.subtext0 },

    -- ---- Semantic tokens — types ----
    ["@lsp.type.class"]         = { fg = p.rb_yellow },
    ["@lsp.type.decorator"]     = { fg = p.sky_blue },
    ["@lsp.type.enum"]          = { fg = p.rb_yellow },
    ["@lsp.type.enumMember"]    = { fg = p.cool_grey },
    ["@lsp.type.event"]         = { fg = p.sky_blue },
    ["@lsp.type.function"]      = { fg = p.chequer_white },
    ["@lsp.type.interface"]     = { fg = p.rb_yellow,   italic = true },
    ["@lsp.type.keyword"]       = { fg = p.kerb_red },
    ["@lsp.type.macro"]         = { fg = p.sky_blue },
    ["@lsp.type.method"]        = { fg = p.chequer_white },
    ["@lsp.type.modifier"]      = { fg = p.kerb_red },
    ["@lsp.type.namespace"]     = { fg = p.teal },
    ["@lsp.type.number"]        = { fg = p.light_grey },
    ["@lsp.type.operator"]      = { fg = p.subtext1 },
    ["@lsp.type.parameter"]     = { fg = p.paddock_green },
    ["@lsp.type.property"]      = { fg = p.text },
    ["@lsp.type.regexp"]        = { fg = p.light_grey },
    ["@lsp.type.string"]        = { fg = p.paddock_green },
    ["@lsp.type.struct"]        = { fg = p.rb_yellow },
    ["@lsp.type.type"]          = { fg = p.rb_yellow },
    ["@lsp.type.typeParameter"] = { fg = p.rb_yellow,   italic = true },
    ["@lsp.type.variable"]      = { fg = p.text },

    -- ---- Semantic tokens — modifiers ----
    ["@lsp.mod.readonly"]       = { italic = true },
    ["@lsp.mod.deprecated"]     = { strikethrough = true },
    ["@lsp.mod.defaultLibrary"] = { italic = true },
  }
end

return M
