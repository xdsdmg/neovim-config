local status, lspconfig = pcall(require, "lspconfig")
if not status then
  print("load lspconfig failed")
  return
end

local lspkind = require 'lspkind'

-- Set up nvim-cmp.
local cmp     = require 'cmp'
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
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources(
    { { name = 'nvim_lsp' }, { name = 'luasnip' } },
    { { name = 'buffer' } }
  ),
  formatting = {
    format = lspkind.cmp_format({ wirth_text = false, maxwidth = 50 })
  }
})

vim.cmd [[
     set completeopt=menuone,noinsert,noselect
     highlight! default link CmpItemKind CmpItemMenuDefault
]]

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({ { name = 'cmp_git' } }, { { name = 'buffer' } })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = 'buffer' } }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
})

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  print("load cmp_nvim_lsp failed")
  return
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

local on_attach = function(client, bufnr)
  -- if client.name == "yamlls" then
  --     client.resolved_capabilities.document_formatting = true
  -- end

  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.format() end
    })
  end

  local opts = { noremap = true, silent = true }

  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  vim.keymap.set('n', 'gr', '<Cmd>Lspsaga lsp_finder<cr>', opts)
  vim.keymap.set("n", "ff", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
  -- vim.keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts)
  vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)

  --  vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
  --  vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
  --  vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', opts)
  --  vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<cr>', opts)
  --  vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<cr>', opts)
  --  vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<cr>', opts)
  --  vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)
end

lspconfig["gopls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["lua_ls"].setup {
  on_attach = on_attach,

  settings = {
    Lua = {
      diagnostic = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    }
  }
}

lspconfig["rust_analyzer"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["clangd"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["yamlls"].setup {
  settings  = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
      },
    }
  },
  -- capabilities = capabilities,
  on_attach = on_attach,
}
