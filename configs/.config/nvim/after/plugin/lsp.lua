local lsp_zero = require('lsp-zero')

-- Setup default keymaps when LSP attaches to a buffer
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Setup Mason and ensure LSP servers are installed
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'pyright', 'lua_ls' },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })
    end,
  },
})

-- Setup nvim-cmp (completion)
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }
})

