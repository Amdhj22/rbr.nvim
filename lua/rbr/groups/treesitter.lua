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

    -- ---- Functions (3rd accent — chequer_white) ----
    ["@function"]             = { fg = p.chequer_white },
    ["@function.builtin"]     = { fg = p.chequer_white, italic = true },
    ["@function.call"]        = { fg = p.chequer_white },
    ["@function.macro"]       = { fg = p.sky_blue },        -- macro keeps the attribute feel
    ["@function.method"]      = { fg = p.chequer_white },
    ["@function.method.call"] = { fg = p.chequer_white },
    ["@constructor"]          = { fg = p.rb_yellow },        -- constructors are type-leaning

    -- ---- Variables ----
    ["@variable"]           = { fg = p.text },
    ["@variable.builtin"]   = { fg = p.oracle_blue,    italic = true },
    ["@variable.parameter"] = { fg = p.paddock_green },
    ["@variable.member"]    = { fg = p.text },

    -- ---- Types ----
    ["@type"]            = { fg = p.rb_yellow },
    ["@type.builtin"]    = { fg = p.rb_yellow, italic = true },
    ["@type.definition"] = { fg = p.rb_yellow },
    ["@type.qualifier"]  = { fg = p.kerb_red },

    -- ---- Constants ----
    ["@constant"]         = { fg = p.cool_grey },
    ["@constant.builtin"] = { fg = p.cool_grey, italic = true },
    ["@constant.macro"]   = { fg = p.sky_blue },

    -- ---- Strings ----
    ["@string"]               = { fg = p.paddock_green },
    ["@string.escape"]        = { fg = p.sky_blue },
    ["@string.special"]       = { fg = p.sky_blue },
    ["@string.special.url"]   = { fg = p.oracle_blue,   underline = true },
    ["@string.regexp"]        = { fg = p.light_grey },
    ["@string.documentation"] = { fg = p.paddock_green, italic = italic },

    -- ---- Numbers ----
    ["@number"]       = { fg = p.light_grey },
    ["@number.float"] = { fg = p.light_grey },
    ["@boolean"]      = { fg = p.light_grey },

    -- ---- Punctuation ----
    ["@operator"]              = { fg = p.subtext1 },
    ["@punctuation"]           = { fg = p.subtext1 },
    ["@punctuation.bracket"]   = { fg = p.subtext1 },
    ["@punctuation.delimiter"] = { fg = p.subtext1 },
    ["@punctuation.special"]   = { fg = p.livery_blue },

    -- ---- Tags (HTML / JSX / XML) ----
    ["@tag"]           = { fg = p.kerb_red },
    ["@tag.builtin"]   = { fg = p.kerb_red },
    ["@tag.attribute"] = { fg = p.rb_yellow },
    ["@tag.delimiter"] = { fg = p.subtext1 },

    -- ---- Namespace / module / label / property ----
    ["@namespace"] = { fg = p.livery_blue },
    ["@module"]    = { fg = p.livery_blue },
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
    ["@markup.heading.5"]      = { fg = p.livery_blue,         bold = true },
    ["@markup.heading.6"]      = { fg = p.subtext1,     bold = true },
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
    ["@markup.math"]           = { fg = p.light_grey },
    ["@markup.environment"]    = { fg = p.sky_blue },

    -- ---- Diff ----
    ["@diff.plus"]  = { fg = p.paddock_green },
    ["@diff.minus"] = { fg = p.kerb_bright },
    ["@diff.delta"] = { fg = p.rb_yellow },
  }
end

return M
