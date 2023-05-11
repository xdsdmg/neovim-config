-- 外观
vim.opt.number = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.o.wrap = false

-- 编码
vim.opt.encoding = "utf-8"

-- 缩进
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

-- 搜索
vim.opt.hlsearch = true
vim.opt.ignorecase = true

-- 高亮
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = 'dark'

vim.cmd [[set mouse=a]]

vim.opt.clipboard:append { 'unnamedplus' }
