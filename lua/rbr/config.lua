-- User-facing options.
--
-- Call `require("rbr").setup({ ... })` before `:colorscheme rbr`.
-- Anything you don't override is filled from `M.defaults`.

local M = {}

M.defaults = {
  -- Which flavor to load. Currently only "classic" exists; future
  -- flavors (e.g. a light "monza") will be added without breaking this.
  flavor = "classic",

  -- Make `Normal` and related groups use bg = NONE so the terminal's
  -- background (e.g. Ghostty's transparent blur) shows through.
  --
  -- Accepts:
  --   false           -- always opaque (default)
  --   true            -- always transparent
  --   function -> any -- called once at load(); truthy result enables it.
  --                     Useful to follow the host terminal — e.g. parse
  --                     Ghostty's background-opacity at nvim start.
  transparent = false,

  -- Render comments in italics. Disable if your font lacks a proper italic cut.
  italic_comments = true,

  -- Enable/disable groups of highlights. The three "core" groups cover
  -- stock Neovim; plugin integrations are opt-in so unknown plugins do
  -- not get stray highlights.
  integrations = {
    -- core
    syntax     = true,
    treesitter = true,
    lsp        = true,

    -- plugins (opt-in)
    gitsigns   = false,
    telescope  = false,
    ["nvim-tree"] = false,
    cmp        = false,
    which_key  = false,
  },
}

-- The active options. Replaced on every `setup()` call.
M.options = vim.deepcopy(M.defaults)

function M.setup(user_opts)
  M.options = vim.tbl_deep_extend("force", M.defaults, user_opts or {})
end

return M
