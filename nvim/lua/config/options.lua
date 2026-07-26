local opt = vim.opt

-- Leader key must be set before plugins load
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.cursorline = true
opt.scrolloff = 8
opt.wrap = false
opt.splitright = true
opt.splitbelow = true

-- Treesitter-based folding (see plugins/treesitter.lua) without folding
-- everything shut on open
opt.foldlevelstart = 99

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Behavior
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.swapfile = false
opt.updatetime = 250
opt.timeoutlen = 400
opt.completeopt = { "menu", "menuone", "noselect" }

-- Have a Nerd Font? Set to true for nicer icons everywhere (explorer,
-- statusline, tabs). If icons show as boxes/question marks, leave false
-- or install one, e.g.: brew install --cask font-jetbrains-mono-nerd-font
vim.g.have_nerd_font = true
