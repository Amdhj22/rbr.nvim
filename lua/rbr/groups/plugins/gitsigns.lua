-- gitsigns.nvim integration.
-- Enable with:
--     require("rbr").setup({ integrations = { gitsigns = true } })
--
-- The color choices mirror the RBR git-status convention (see
-- STYLE-GUIDE.md). "Modified" gets rb_yellow — the attention color —
-- because an unstaged edit is the most common thing you need to notice
-- while coding.

local M = {}

function M.get(ctx)
  local p = ctx.p

  return {
    GitSignsAdd          = { fg = p.paddock_green },
    GitSignsChange       = { fg = p.rb_yellow },
    GitSignsDelete       = { fg = p.kerb_bright },
    GitSignsTopdelete    = { fg = p.kerb_bright },
    GitSignsChangedelete = { fg = p.rb_warm },
    GitSignsUntracked    = { fg = p.rb_warm },

    GitSignsAddNr        = { fg = p.paddock_green },
    GitSignsChangeNr     = { fg = p.rb_yellow },
    GitSignsDeleteNr     = { fg = p.kerb_bright },

    -- Full-line backgrounds. Hand-mixed to match the `DiffAdd/Change/Delete`
    -- tints in `editor.lua` so gitsigns and :diff mode look consistent.
    GitSignsAddLn    = { bg = "#1a2a25" },
    GitSignsChangeLn = { bg = "#2b2619" },
    GitSignsDeleteLn = { bg = "#2b151c" },

    -- "Staged" variants use lower-saturation siblings so the unstaged
    -- changes remain the louder signal.
    GitSignsStagedAdd          = { fg = p.track_green },
    GitSignsStagedChange       = { fg = p.rb_warm },
    GitSignsStagedDelete       = { fg = p.kerb_pure },
    GitSignsStagedTopdelete    = { fg = p.kerb_pure },
    GitSignsStagedChangedelete = { fg = p.cool_grey },

    -- Current-line blame ghost text.
    GitSignsCurrentLineBlame = { fg = p.subtext0, italic = true },
  }
end

return M
