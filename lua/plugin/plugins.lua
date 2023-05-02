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
    use {
        'svrana/neosolarized.nvim',
        requires = {'tjdevries/colorbuddy.nvim'}
    }
    use 'scrooloose/nerdtree'
    use 'kyazdani42/nvim-web-devicons' -- File icons

    -- lsp 相关插件
    use 'neovim/nvim-lspconfig'
    -- mason lsp 包管理器
    use 'williamboman/mason.nvim' 
    use 'williamboman/mason-lspconfig.nvim'
    -- formatting & linting
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
end)
