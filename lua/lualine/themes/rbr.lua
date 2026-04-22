-- lualine theme for rbr.nvim.
-- Usage:
--     require("lualine").setup({ options = { theme = "rbr" } })
--
-- lualine auto-discovers theme files at `lua/lualine/themes/<name>.lua`,
-- so this sits outside the normal `lua/rbr/...` tree. No integration
-- flag is needed — setting `theme = "rbr"` is enough.
--
-- Mode accents follow the "one brand red per viewport" rule: the
-- `normal` mode — the active default — gets Kerb Red. Every other mode
-- uses a distinct accent so mode changes are unmissable without piling
-- extra red on the screen.

local p = require("rbr.palette").classic

local function section(accent)
  return {
    a = { fg = p.base,     bg = accent,     gui = "bold" },
    b = { fg = p.text,     bg = p.surface2 },
    c = { fg = p.subtext1, bg = p.mantle   },
  }
end

return {
  normal   = section(p.kerb_red),
  insert   = section(p.paddock_green),
  visual   = section(p.rb_yellow),
  replace  = section(p.kerb_bright),
  command  = section(p.oracle_blue),
  terminal = section(p.crowd_orange),

  inactive = {
    a = { fg = p.subtext1, bg = p.mantle },
    b = { fg = p.subtext0, bg = p.mantle },
    c = { fg = p.subtext0, bg = p.mantle },
  },
}
