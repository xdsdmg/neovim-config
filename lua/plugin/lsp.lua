return {
  {
    'williamboman/mason.nvim',
    event = "VeryLazy",
    init = function()
      require("mason").setup()
    end
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip'
    },
    init = function()
      local cmp = require('cmp');
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = {
          { name = 'nvim_lsp' }
        },
        mapping = cmp.mapping.preset.insert({
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
      })
      -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local on_attach = function(client, bufnr)
        -- formatting
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.format() end
          })
        end
      end

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })

      -- Setup language servers.
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      }

      lspconfig["gopls"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lspconfig["rust_analyzer"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      lspconfig["clangd"].setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- lspconfig["java_language_server"].setup {
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      -- }

      require 'lspconfig'.java_language_server.setup {}

      require 'lspconfig'.pyright.setup {}
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    init = function()
      -- Ref: https://www.reddit.com/r/neovim/comments/13sdxep/how_to_setup_formatter_for_python/
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.black,
        },
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      require("nvim-treesitter.configs").setup({
        -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
          "cpp",
          "rust",
          "go",
          "latex",
        },
        -- auto install above language parsers
        auto_install = true,
      })
    end
  },
}
