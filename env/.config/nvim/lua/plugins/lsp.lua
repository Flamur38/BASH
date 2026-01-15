-- LSP Support (Neovim >= 0.11)
return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        { "j-hui/fidget.nvim", opts = {} },
        { "folke/neodev.nvim", opts = {} },
        { "hrsh7th/cmp-nvim-lsp" },
    },

    config = function()
        ----------------------------------------------------------------------
        -- Mason
        ----------------------------------------------------------------------
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "bashls",
                "lua_ls",
                "pyright",
                "lemminx",
                "marksman",
                "quick_lint_js",
            },
            automatic_installation = false,
            handlers = {}, -- 🚫 REQUIRED: disables deprecated lspconfig.setup()
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "black",
                "debugpy",
                "flake8",
                "isort",
                "mypy",
                "pylint",
                "pytest",
                "ipython",
                "jupyter",
            },
        })

        require("fidget").setup({})

        ----------------------------------------------------------------------
        -- Capabilities
        ----------------------------------------------------------------------
        local capabilities =
            require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

        ----------------------------------------------------------------------
        -- on_attach
        ----------------------------------------------------------------------
        local on_attach = function(_, bufnr)
            local map = function(mode, lhs, rhs)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
            end

            map("n", "gd", vim.lsp.buf.definition)
            map("n", "K", vim.lsp.buf.hover)
            map("n", "gr", vim.lsp.buf.references)
            map("n", "gi", vim.lsp.buf.implementation)
            map("n", "<leader>rn", vim.lsp.buf.rename)
            map("n", "<leader>ca", vim.lsp.buf.code_action)

            -- Run pytest on current file
            map("n", "<leader>tt", function()
                vim.cmd("!pytest %")
            end)
        end

        ----------------------------------------------------------------------
        -- Python virtualenv detection
        ----------------------------------------------------------------------
        local function get_python_path(workspace)
            if vim.env.VIRTUAL_ENV then
                return vim.env.VIRTUAL_ENV .. "/bin/python"
            end

            local venv = vim.fn.glob(workspace .. "/.venv/bin/python")
            if venv ~= "" then
                return venv
            end

            return "python3"
        end

        ----------------------------------------------------------------------
        -- LSP server configs (NEW API)
        ----------------------------------------------------------------------
        vim.lsp.config("bashls", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.lsp.config("lemminx", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.lsp.config("marksman", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.lsp.config("quick_lint_js", {
            capabilities = capabilities,
            on_attach = on_attach,
        })

        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                },
            },
        })

        vim.lsp.config("pyright", {
            capabilities = capabilities,
            on_attach = on_attach,
            before_init = function(_, config)
                local root = config.root_dir or vim.fn.getcwd()
                config.settings = {
                    python = {
                        pythonPath = get_python_path(root),
                    },
                }
            end,
        })

        ----------------------------------------------------------------------
        -- Enable servers
        ----------------------------------------------------------------------
        vim.lsp.enable({
            "bashls",
            "lua_ls",
            "pyright",
            "lemminx",
            "marksman",
            "quick_lint_js",
        })

        ----------------------------------------------------------------------
        -- UI polish
        ----------------------------------------------------------------------
        local orig = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or "rounded"
            return orig(contents, syntax, opts, ...)
        end
    end,
}

