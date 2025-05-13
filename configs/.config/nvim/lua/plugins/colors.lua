-- lua/plugins/rose-pine.lua
return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },
            highlight_groups = {
                -- Uncomment and customize as needed
                -- Comment = { fg = "foam" },
                -- StatusLine = { fg = "love", bg = "pine", blend = 15 },
                -- VertSplit = { fg = "muted", bg = "muted" },
                -- Visual = { fg = "base", bg = "text", inherit = false },
            },
        })

        vim.cmd("colorscheme rose-pine")
    end
}
-- ====== Sublime =====
--
-- return {
--     {
--         "kaiuri/nvim-juliana",
--         lazy = false,
--         priority = 1000,
--         opts = {}, -- theme has no specific options
--         config = function()
--             vim.cmd("colorscheme juliana")
--
--             vim.api.nvim_set_hl(0, "Normal",      { bg = "None" })
--             vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
--             vim.api.nvim_set_hl(0, "FloatBorder", { bg = "None" })
--             vim.api.nvim_set_hl(0, "SignColumn",  { bg = "None" })
--             vim.api.nvim_set_hl(0, "StatusLine",  { bg = "None" })
--             vim.api.nvim_set_hl(0, "CursorLineNr",  { bg = "None", bold = true }) -- Optional: Transparent number column highlight
--             vim.api.nvim_set_hl(0, "CursorLine",    { bg = "None" })              -- Transparent cursorline
--             --
--             -- Comment color from juliana palette (use fg4 = '#46525c')
--             local comment_color = "#46526C"
--             vim.api.nvim_set_hl(0, "Comment",   { fg = comment_color, italic = false })
--             vim.api.nvim_set_hl(0, "@comment",  { fg = comment_color, italic = false })
--
--         end,
--     },
-- }
