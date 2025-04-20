-- config/options.lua

-- ========== OPTIONS ========== --
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Search Settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.guicursor = ""

vim.opt.termguicolors = true
vim.opt.mouse = ""

-- ========== KEYMAPS ========== --
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")


-- ========= Run current Python file in a terminal ===========
vim.keymap.set("n", "<space>rr", function()
    -- Save file
    vim.cmd("write")

    -- Open terminal and run Python file
    vim.cmd("split | terminal python3 " .. vim.fn.expand("%"))
    vim.cmd("resize 15")

    -- Enter terminal mode automatically so input() works!
    vim.api.nvim_feedkeys("i", "n", false)
end)


-- ========== Telescope Keymaps ========== --

-- [<space>fh] → Show all help tags
vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)

-- [<space>fd] → Find files in the current directory
vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files)

-- [<space>fp] → File picker with :Explore (netrw or Oil)
vim.keymap.set("n", "<space>fp", "<cmd>Explore<CR>")

-- [<space>fc] → Find files in Neovim config
vim.keymap.set("n", "<space>fc", function()
    require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath("config"), -- ~/.config/nvim
    }
end)
