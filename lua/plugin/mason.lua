-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
    print("load mason failed")
    return
end

mason.setup()

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    print("load mason-lspconfig failed")
    return
end

mason_lspconfig.setup({
    -- list of servers for mason to install
    ensure_installed = {"gopls"},
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true -- not the same as ensure_installed
})

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
    print("load mason-null-ls failed")
    return
end

mason_null_ls.setup({
    -- list of formatters & linters for mason to install
    ensure_installed = {"golangci-lint", "goimports"},
    -- auto-install configured formatters & linters (with null-ls)
    automatic_installation = true
})
