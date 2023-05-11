require("base")           -- 加载基本配置
require("keymap")         -- 加载快捷键配置

require("plugin.plugins") -- 加载插件管理器
require("plugin.theme")   -- 加载主题配置
require("plugin.lualine") -- 加载 lualine 配置
require("plugin.bufferline")
require("plugin.nvim_tree")
require("plugin.icon")

-- 加载 lsp 相关插件
require("plugin.lsp_cmp_ui")
require("plugin.mason")
require("plugin.lsp")
require("plugin.treesitter")
require("plugin.lspsaga")
require("plugin.null-ls")

require("plugin.gitlens")
require("plugin.clipboard")

require("plugin.telescope")
