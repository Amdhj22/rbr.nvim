-- Build a single flat highlight table from the configured groups.
--
-- Each group module exposes `get(ctx) -> table` so it can read the palette
-- and config without globals. Results are shallow-merged in load order;
-- later groups win on conflicts, which lets plugin integrations override
-- core defaults intentionally.

local M = {}

local CORE_KEYS = { "syntax", "treesitter", "lsp" }

local function is_core(name)
  for _, k in ipairs(CORE_KEYS) do
    if k == name then return true end
  end
  return false
end

local function merge(dst, src)
  for k, v in pairs(src) do dst[k] = v end
end

function M.build(config, palette)
  -- Shared context passed to every group module.
  local ctx = {
    p = palette,
    c = config,
    -- Respect `transparent = true` by returning "NONE" for background colors
    -- that should follow the terminal.
    bg = function(color)
      return config.transparent and "NONE" or color
    end,
  }

  local hl = {}

  -- Editor chrome is always loaded — it's the floor every other group stands on.
  merge(hl, require("rbr.groups.editor").get(ctx))

  -- Core groups (syntax / treesitter / lsp) load based on their flags.
  for _, key in ipairs(CORE_KEYS) do
    if config.integrations[key] then
      local ok, mod = pcall(require, "rbr.groups." .. key)
      if ok then merge(hl, mod.get(ctx)) end
    end
  end

  -- Plugin integrations: anything truthy under `integrations` that is not a core key.
  for name, enabled in pairs(config.integrations) do
    if enabled and not is_core(name) then
      local ok, mod = pcall(require, "rbr.groups.plugins." .. name)
      if ok then merge(hl, mod.get(ctx)) end
    end
  end

  return hl
end

return M
