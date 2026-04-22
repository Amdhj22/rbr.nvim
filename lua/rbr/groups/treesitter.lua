-- Treesitter `@captures`.
-- Covers modern highlighting in filetypes that have a tree-sitter parser.
-- See `:help treesitter-highlight-groups` for the full list.
--
-- The mapping follows the same rules as `syntax.lua`, but with finer
-- resolution. For example, `@keyword.return` is bold-red while
-- `@keyword.operator` stays a muted subtext so logical expressions
-- (`and`, `or`, `not`, `in`) don't drown the screen in red.

local M = {}

function M.get(ctx)
  local p = ctx.p
  local italic = ctx.c.italic_comments

  return {
    -- ---- Comments ----
    ["@comment"]               = { fg = p.subtext0,    italic = italic },
    ["@comment.documentation"] = { fg = p.oracle_blue, italic = italic },
    ["@comment.error"]         = { fg = p.kerb_bright, bold = true },
    ["@comment.warning"]       = { fg = p.rb_yellow,   bold = true },
    ["@comment.todo"]          = { fg = p.rb_yellow,   bg = p.surface1, bold = true },
    ["@comment.note"]          = { fg = p.oracle_blue, bg = p.surface1, bold = true },

    -- ---- Keywords & control flow ----
    ["@keyword"]             = { fg = p.kerb_red },
    ["@keyword.function"]    = { fg = p.kerb_red },
    ["@keyword.return"]      = { fg = p.kerb_red, bold = true },
    ["@keyword.conditional"] = { fg = p.kerb_red },
    ["@keyword.repeat"]      = { fg = p.kerb_red },
    ["@keyword.exception"]   = { fg = p.kerb_red },
    ["@keyword.import"]      = { fg = p.kerb_red },
    ["@keyword.operator"]    = { fg = p.subtext1 },
    ["@keyword.storage"]     = { fg = p.rb_yellow },
    ["@keyword.modifier"]    = { fg = p.rb_yellow },
    ["@keyword.coroutine"]   = { fg = p.kerb_red },

    -- ---- Functions ----
    ["@function"]             = { fg = p.oracle_blue },
    ["@function.builtin"]     = { fg = p.oracle_blue, italic = true },
    ["@function.call"]        = { fg = p.oracle_blue },
    ["@function.macro"]       = { fg = p.sky_blue },
    ["@function.method"]      = { fg = p.oracle_blue },
    ["@function.method.call"] = { fg = p.oracle_blue },
    ["@constructor"]          = { fg = p.rb_yellow },

    -- ---- Variables ----
    ["@variable"]           = { fg = p.text },
    ["@variable.builtin"]   = { fg = p.warm_pink,    italic = true },
    ["@variable.parameter"] = { fg = p.crowd_orange },
    ["@variable.member"]    = { fg = p.text },

    -- ---- Types ----
    ["@type"]            = { fg = p.rb_yellow },
    ["@type.builtin"]    = { fg = p.rb_yellow, italic = true },
    ["@type.definition"] = { fg = p.rb_yellow },
    ["@type.qualifier"]  = { fg = p.kerb_red },

    -- ---- Constants ----
    ["@constant"]         = { fg = p.warm_pink },
    ["@constant.builtin"] = { fg = p.warm_pink, italic = true },
    ["@constant.macro"]   = { fg = p.sky_blue },

    -- ---- Strings ----
    ["@string"]               = { fg = p.paddock_green },
    ["@string.escape"]        = { fg = p.warm_pink },
    ["@string.special"]       = { fg = p.crowd_orange },
    ["@string.special.url"]   = { fg = p.oracle_blue,   underline = true },
    ["@string.regexp"]        = { fg = p.crowd_orange },
    ["@string.documentation"] = { fg = p.paddock_green, italic = italic },

    -- ---- Numbers ----
    ["@number"]       = { fg = p.crowd_orange },
    ["@number.float"] = { fg = p.crowd_orange },
    ["@boolean"]      = { fg = p.crowd_orange },

    -- ---- Punctuation ----
    ["@operator"]              = { fg = p.subtext1 },
    ["@punctuation"]           = { fg = p.subtext1 },
    ["@punctuation.bracket"]   = { fg = p.subtext1 },
    ["@punctuation.delimiter"] = { fg = p.subtext1 },
    ["@punctuation.special"]   = { fg = p.crowd_orange },

    -- ---- Tags (HTML / JSX / XML) ----
    ["@tag"]           = { fg = p.kerb_red },
    ["@tag.builtin"]   = { fg = p.kerb_red },
    ["@tag.attribute"] = { fg = p.rb_yellow },
    ["@tag.delimiter"] = { fg = p.subtext1 },

    -- ---- Namespace / module / label / property ----
    ["@namespace"] = { fg = p.crowd_orange },
    ["@module"]    = { fg = p.crowd_orange },
    ["@label"]     = { fg = p.oracle_blue },
    ["@property"]  = { fg = p.text },
    ["@field"]     = { fg = p.text },

    -- ---- Attributes / decorators (Rust #[...], Python @decorator) ----
    ["@attribute"] = { fg = p.sky_blue },

    -- ---- Markdown / markup ----
    ["@markup.heading"]        = { fg = p.kerb_red,      bold = true },
    ["@markup.heading.1"]      = { fg = p.kerb_red,      bold = true },
    ["@markup.heading.2"]      = { fg = p.rb_yellow,     bold = true },
    ["@markup.heading.3"]      = { fg = p.paddock_green, bold = true },
    ["@markup.heading.4"]      = { fg = p.oracle_blue,   bold = true },
    ["@markup.heading.5"]      = { fg = p.crowd_orange,  bold = true },
    ["@markup.heading.6"]      = { fg = p.warm_pink,     bold = true },
    ["@markup.strong"]         = { fg = p.text,          bold = true },
    ["@markup.italic"]         = { fg = p.text,          italic = true },
    ["@markup.strikethrough"]  = { fg = p.subtext1,      strikethrough = true },
    ["@markup.underline"]      = { underline = true },
    ["@markup.link"]           = { fg = p.oracle_blue },
    ["@markup.link.url"]       = { fg = p.sky_blue,      underline = true },
    ["@markup.link.label"]     = { fg = p.oracle_blue },
    ["@markup.list"]           = { fg = p.kerb_red },
    ["@markup.list.checked"]   = { fg = p.paddock_green },
    ["@markup.list.unchecked"] = { fg = p.subtext1 },
    ["@markup.quote"]          = { fg = p.subtext1,      italic = italic },
    ["@markup.raw"]            = { fg = p.paddock_green },
    ["@markup.math"]           = { fg = p.crowd_orange },
    ["@markup.environment"]    = { fg = p.sky_blue },

    -- ---- Diff ----
    ["@diff.plus"]  = { fg = p.paddock_green },
    ["@diff.minus"] = { fg = p.kerb_bright },
    ["@diff.delta"] = { fg = p.rb_yellow },
  }
end

return M
