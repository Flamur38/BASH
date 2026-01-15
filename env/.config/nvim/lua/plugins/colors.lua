-- return {
--   {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("rose-pine").setup({
--         variant = "auto",         -- auto-switch based on system theme
--         dark_variant = "main",    -- use "main" variant (warm tones)
--         dim_inactive_windows = false,
--         extend_background_behind_borders = true,
--
--         enable = {
--           terminal = true,
--           legacy_highlights = true,
--           migrations = true,
--         },
--
--         styles = {
--           bold = true,
--           italic = true,
--           transparency = true,
--         },
--
--         highlight_groups = {
--           Function = { fg = "#E95420" },     -- Ubuntu orange
--           Identifier = { fg = "#77216F" },   -- Ubuntu aubergine
--
--           -- Optional transparent tweaks
--           Normal      = { bg = "none" },
--           NormalNC    = { bg = "none" },
--           SignColumn  = { bg = "none" },
--           VertSplit   = { bg = "none" },
--           EndOfBuffer = { bg = "none" },
--           CursorLine  = { bg = "none" },
--           CursorLineNr = { bg = "none" },
--         },
--       })
--
--       vim.cmd("colorscheme rose-pine")
--     end,
--   },
-- }

-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  "kaiuri/nvim-juliana",
  lazy = false,
  priority = 1000,
  config = function()
    require("nvim-juliana").setup({
      transparent = true,
    })
    vim.cmd("colorscheme juliana")
    vim.cmd [[
      highlight Normal      guibg=NONE ctermbg=NONE
      highlight NormalNC    guibg=NONE ctermbg=NONE
      highlight SignColumn  guibg=NONE ctermbg=NONE
      highlight VertSplit   guibg=NONE ctermbg=NONE
      highlight EndOfBuffer guibg=NONE ctermbg=NONE
      highlight CursorLine     guibg=NONE ctermbg=NONE
      highlight CursorLineNr   guibg=NONE ctermbg=NONE
    ]]
  end,
}
