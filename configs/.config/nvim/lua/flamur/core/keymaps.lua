local keymap = vim.keymap

vim.g.mapleader = " "

-- ========== General Keymaps ==========
vim.keymap.set("n", "<leader>fp", vim.cmd.Ex)                                -- File explorer

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")                                 -- Move lines down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")                                 -- Move lines up

vim.keymap.set("n", "<C-u>", "<C-u>zz")                                      -- Scroll up and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")                                      -- Scroll down and center

vim.keymap.set("n", "n", "nzzzv")                                            -- Next search result
vim.keymap.set("n", "N", "Nzzzv")                                            -- Prev search result

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])  -- Search and replace
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- Make file executable


-- ========== Harpoon ==========
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon add file" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon menu" })

vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end, { desc = "Harpoon: File 1" })
vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end, { desc = "Harpoon: File 2" })
vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end, { desc = "Harpoon: File 3" })
vim.keymap.set("n", "<C-;>", function() ui.nav_file(4) end, { desc = "Harpoon: File 4" })


-- ========== Telescope ==========
local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope: Find files" })
vim.keymap.set("n", "<C-p>", telescope.git_files, { desc = "Telescope: Git files" })
vim.keymap.set("n", "<leader>fs", function()
  telescope.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Telescope: Grep string" })

-- ========= Toggle Undotree with <leader>u ==========
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })


-- =========== Run Python file ===========
vim.keymap.set("n", "<leader>rr", function()
  vim.cmd("terminal python3 %")
  vim.cmd("startinsert")  -- This puts you in insert mode
end, { desc = "Run Python file in terminal" })

