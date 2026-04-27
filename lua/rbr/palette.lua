-- Palette vendored from rbr-theme:
--   https://github.com/Amdhj22/rbr/blob/main/palette.json
-- Version: 2.2.0 (Classic flavor)
--
-- Update manually when the upstream palette changes. A future umbrella
-- repo may provide a shared sync tool across all rbr port colorschemes.

local M = {}

-- ---- Classic flavor ----
M.classic = {
  -- Accent colors
  kerb_red        = "#e84a55",
  kerb_bright     = "#f56570",
  kerb_pure       = "#cc1e4a",
  rb_yellow       = "#ffd84d",
  rb_warm         = "#f5c842",
  rb_pure         = "#ffc906",
  oracle_blue     = "#82a0d8",
  sky_blue        = "#a4bde8",
  track_green     = "#9cc080",
  paddock_green   = "#b8d49e",
  cool_grey       = "#a8a8b0",
  light_grey    = "#c8c8d0",
  teal            = "#95c0c8",
  pit_light       = "#b0d4dc",

  -- Neutral layers (darkest → brightest)
  crust           = "#05091a",
  mantle          = "#070d1f",
  base            = "#0a1128",
  surface0        = "#121a36",
  surface1        = "#15203f",
  surface2        = "#1f2a52",
  overlay0        = "#3a4466",
  overlay1        = "#4a5580",
  overlay2        = "#565f80",
  subtext0        = "#6a7495",
  subtext1        = "#8590ae",
  text            = "#c8d0e8",

  -- ANSI 0-15 (used by :terminal via vim.g.terminal_color_*)
  ansi = {
    [ 0] = "#05091a",
    [ 1] = "#e84a55",
    [ 2] = "#9cc080",
    [ 3] = "#f5c842",
    [ 4] = "#82a0d8",
    [ 5] = "#a8a8b0",
    [ 6] = "#95c0c8",
    [ 7] = "#c8d0e8",
    [ 8] = "#3a4466",
    [ 9] = "#f56570",
    [10] = "#b8d49e",
    [11] = "#ffd84d",
    [12] = "#a4bde8",
    [13] = "#c8c8d0",
    [14] = "#b0d4dc",
    [15] = "#e8ecf5",
  },
}

return M
