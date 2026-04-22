-- rbr.nvim — Red Bull Racing colorscheme for Neovim.
--
-- Public API:
--   require("rbr").setup({ ... })   -- optional; pass user options
--   require("rbr").load()           -- apply the colorscheme
--
-- You normally don't call load() directly — `:colorscheme rbr` triggers
-- colors/rbr.lua, which calls load() for you.

local M = {}

-- Re-export setup so users can do `require("rbr").setup(...)`.
M.setup = require("rbr.config").setup

local function min_version_ok()
  if not vim.version then return false end
  local v = vim.version()
  return v.major > 0 or v.minor >= 8
end

function M.load()
  if not min_version_ok() then
    vim.notify("[rbr] Neovim 0.8+ is required.", vim.log.levels.ERROR)
    return
  end

  -- Wipe any previously applied colorscheme before painting our own.
  if vim.g.colors_name then vim.cmd("hi clear") end
  if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end

  vim.o.termguicolors = true
  vim.o.background    = "dark"
  vim.g.colors_name   = "rbr"

  local config  = require("rbr.config").options
  local palette = require("rbr.palette")[config.flavor]
  if not palette then
    vim.notify("[rbr] unknown flavor: " .. tostring(config.flavor), vim.log.levels.ERROR)
    return
  end

  -- Build and apply the highlight table.
  local theme = require("rbr.theme").build(config, palette)
  for group, spec in pairs(theme) do
    vim.api.nvim_set_hl(0, group, spec)
  end

  -- Wire ANSI colors for `:terminal` so terminal buffers stay on-brand.
  for i = 0, 15 do
    vim.g["terminal_color_" .. i] = palette.ansi[i]
  end
end

return M
