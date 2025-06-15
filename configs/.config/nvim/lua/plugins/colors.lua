-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        disable_background = true,  -- Enables transparency
        disable_float_background = true,
        styles = {
          italic = true,
          bold = true,
        },
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },
}

-- return {
--   {
--     "audibleblink/hackthebox.vim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       vim.cmd("colorscheme hackthebox")
--
--       -- Transparent background
--       vim.cmd [[
--         hi Normal guibg=NONE ctermbg=NONE
--         hi NormalNC guibg=NONE ctermbg=NONE
--         hi NormalFloat guibg=NONE ctermbg=NONE
--         hi EndOfBuffer guibg=NONE ctermbg=NONE
--         hi SignColumn guibg=NONE ctermbg=NONE
--         hi VertSplit guibg=NONE ctermbg=NONE
--         hi StatusLine guibg=NONE ctermbg=NONE
--         hi LineNr guibg=NONE ctermbg=NONE
--         hi Folded guibg=NONE ctermbg=NONE
--       ]]
--     end,
--   },
-- }

-- ~/.config/nvim/lua/plugins/colorscheme.lua
-- return {
--   "kaiuri/nvim-juliana",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("nvim-juliana").setup({
--       transparent = true,
--     })
--     vim.cmd("colorscheme juliana")
--     vim.cmd [[
--       highlight Normal      guibg=NONE ctermbg=NONE
--       highlight NormalNC    guibg=NONE ctermbg=NONE
--       highlight SignColumn  guibg=NONE ctermbg=NONE
--       highlight VertSplit   guibg=NONE ctermbg=NONE
--       highlight EndOfBuffer guibg=NONE ctermbg=NONE
--       highlight CursorLine     guibg=NONE ctermbg=NONE
--       highlight CursorLineNr   guibg=NONE ctermbg=NONE
--     ]]
--   end,
-- }
