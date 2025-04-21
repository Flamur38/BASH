-- General Neovim Settings

local opt = vim.opt

opt.hlsearch = false
opt.incsearch = true

opt.guicursor = ""

opt.termguicolors = true

opt.scrolloff = 8

-- Disable mouse
opt.mouse = ""

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Clipboard
opt.clipboard:append("unnamedplus")
