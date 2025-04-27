vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.codeium_disable_bindings = 1 -- disable default bindings for codeium

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.splitbelow = true -- split below instead of above
opt.splitright = true

vim.opt.wrap = false

-- set spellcheck
-- use zg to add word to dictionary
opt.spelllang = "en_us"
opt.spell = true

opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.softtabstop = 4
opt.mouse = "a"
opt.mousemoveevent = true
opt.ignorecase = true
opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.virtualedit = "block"
-- opt.scrolloff = 999
opt.signcolumn = "yes"

-- set fold stuffs for plugin nvim-ufo
opt.foldlevel = 99

-- set conceallevel for markdown obsidian
opt.conceallevel = 2
