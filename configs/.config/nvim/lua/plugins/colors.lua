-- lua/plugins/rose-pine.lua
return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "auto",         -- "auto", "main", "moon", or "dawn"
      dark_variant = "main",    -- "main", "moon", or "dawn"
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
      },

      styles = {
        bold = true,
        italic = true,
        transparency = true,    -- <--- ENABLE TRANSPARENCY HERE
      },

      groups = {
        border = "muted",
        link = "iris",
        panel = "surface",
        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",
        -- add more groups if you want
      },

      highlight_groups = {
        Normal = { bg = "none" },          -- TRANSPARENT BACKGROUND
        NormalNC = { bg = "none" },
        SignColumn = { bg = "none" },
        VertSplit = { bg = "none" },
        EndOfBuffer = { bg = "none" },
        CursorLine = { bg = "none" },      -- optional: no background on cursor line
        CursorLineNr = { bg = "none" },    -- optional
      },
    })

    vim.cmd("colorscheme rose-pine")
  end,
}

-- Example snippet from your plugin specs file
-- return {
--   -- other plugins...
--   {
--     "folke/tokyonight.nvim",
--     lazy = false,  -- load at startup
--     priority = 1000,
--     config = function()
--       require("tokyonight").setup({
--         style = "storm", -- 'storm', 'night', 'day'
--         transparent = true,
--         terminal_colors = true,
--         styles = {
--           comments = { italic = true },
--           keywords = { italic = false },
--           functions = {},
--           variables = {},
--           sidebars = "dark", -- dark background for sidebar
--           floats = "dark",
--         },
--         on_highlights = function(hl, c)
--           -- Customize highlights to better match your polybar green accent
--           hl.LineNr = { fg = c.green }
--           hl.CursorLineNr = { fg = c.orange, bold = true }
--           hl.StatusLine = { bg = c.bg_dark }
--           hl.TelescopePromptNormal = { bg = c.bg_dark }
--           -- Add more tweaks here if you want
--         end,
--       })
--       vim.cmd("colorscheme tokyonight")
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
