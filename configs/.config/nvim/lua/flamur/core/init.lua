require("flamur.core.options")
require("flamur.core.keymaps")
require("flamur.core.lazy")
require("flamur.plugins.lsp")
require("flamur.plugins.harpoon")
require("flamur.plugins.telescope")

-- 🖍 Highlight on Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

