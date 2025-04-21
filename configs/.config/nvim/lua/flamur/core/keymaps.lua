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

-- ========= Toggle Undotree with <leader>u ==========
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

-- =========== Run Python file ===========
vim.keymap.set("n", "<leader>rr", function()
  vim.cmd("terminal python3 %")
  vim.cmd("startinsert")  -- This puts you in insert mode
end, { desc = "Run Python file in terminal" })

