-- Tiny helpers for matching the host terminal's chrome.
--
-- Usage in your nvim config:
--
--   require("rbr").setup({
--     transparent = require("rbr.detect").ghostty_transparent,
--   })
--
-- The helper is a function reference — rbr.theme.build() calls it once
-- when the colorscheme loads, so no overhead on redraw.

local M = {}

--- Path to the user's Ghostty config (XDG-friendly fallback).
local function ghostty_config_path()
  local xdg = vim.env.XDG_CONFIG_HOME
  if xdg and xdg ~= "" then
    return xdg .. "/ghostty/config"
  end
  return vim.fn.expand("~/.config/ghostty/config")
end

--- True if `~/.config/ghostty/config` declares background-opacity < 1.
--- Ghostty parses lines as `key = value` (with optional whitespace), and the
--- *last* matching line wins, so we read the whole file and keep the final hit.
function M.ghostty_transparent()
  local path = ghostty_config_path()
  if vim.fn.filereadable(path) == 0 then
    return false
  end

  local opacity
  for line in io.lines(path) do
    local v = line:match("^%s*background%-opacity%s*=%s*([%d%.]+)")
    if v then opacity = tonumber(v) end
  end

  return opacity ~= nil and opacity < 1.0
end

return M
