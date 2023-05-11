local status, packer = pcall(require, "packer")

if (not status) then
  print("packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      opt = true
    }
  }

  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }

  use 'preservim/nerdtree'

  use { 'nvim-tree/nvim-tree.lua' }

  use 'nvim-tree/nvim-web-devicons'

  --[[
  lsp 相关插件
  --]]
  use 'neovim/nvim-lspconfig'

  -- mason lsp 包管理器
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- formatting & linting
  use "nvim-lua/plenary.nvim"
  use("jayp0521/mason-null-ls.nvim")
  use 'jose-elias-alvarez/null-ls.nvim'

  -- 自动补全相关插件
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind-nvim'


  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  }

  -- use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'APZelos/blamer.nvim' -- git lens
  use 'AlexvZyl/nordic.nvim'
  use { 'ojroques/nvim-osc52' }

  use 'fatih/vim-go'
  use 'hexdigest/gounit-vim'
end)
