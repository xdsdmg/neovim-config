local opt         = vim.opt
local k           = vim.keymap

opt.nu            = true
opt.showmode      = true
opt.showcmd       = true
opt.wrap          = true
opt.termguicolors = true
opt.encoding      = "utf-8"
opt.autoindent    = true
opt.smartindent   = true
opt.tabstop       = 2
opt.shiftwidth    = 2
opt.expandtab     = true
opt.softtabstop   = 2
opt.hlsearch      = true
opt.ignorecase    = true
-- opt.spell         = true
-- opt.spelllang     = "en_us"

vim.cmd([[syntax on]])
vim.cmd([[filetype plugin indent on]])

opt.background = "dark"
-- vim.cmd([[colorscheme gruvbox]])

opt.cursorline = true
vim.cmd [[autocmd WinLeave * setlocal nocursorline]]
vim.cmd [[autocmd WinEnter * setlocal cursorline]]
vim.cmd [[autocmd TermOpen * setlocal nonumber]]

k.set("n", "ss", "<cmd>wa<CR>")
k.set("n", "nh", "<cmd>nohl<CR>")
k.set("n", "o", "o<Esc>k")
k.set("n", "<Tab>", "<cmd>tabn<CR>")
k.set("n", "<S-Tab>", "<cmd>tabp<CR>")
k.set('n', '<C-n>', '<C-v>')

k.set("n", "nt", "<cmd>NvimTreeToggle<CR>")
k.set("n", "tf", "<cmd>Telescope find_files<CR>")
k.set("n", "tl", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
