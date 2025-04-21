-- 🧠 LSP + Autocompletion + Snippets Configuration (via lsp-zero)

local lsp_zero = require("lsp-zero")

-- Use recommended preset
lsp_zero.preset("recommended")

-- Optional: Custom keymaps when LSP attaches
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- 🔧 Setup Mason (manages LSP servers)
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "lua_ls" }, -- LSPs to auto-install
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
    end,
  },
})

-- ⚙️ Configure Completion (nvim-cmp)
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  mapping = {
    ["<C-p>"]     = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"]     = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"]     = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  },
  sources = {
    { name = "nvim_lsp" },   -- LSP-based completion
    { name = "buffer" },     -- Current buffer
    { name = "path" },       -- Filesystem paths
  },
})

