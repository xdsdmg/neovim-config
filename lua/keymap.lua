vim.keymap.set("n", "nt", "<cmd>NvimTreeToggle<CR>") -- see definition and make edits in window
vim.keymap.set("n", "wa", "<cmd>wa<CR>")             -- see definition and make edits in window
vim.keymap.set("n", "ss", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<C-s>s", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.g.mapleader = "<Space>"
