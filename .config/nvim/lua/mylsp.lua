lsp = require('lspconfig')
require('mason').setup()
require('mason-lspconfig').setup_handlers {
    function (server_name) -- default handler (optional)
        lsp[server_name].setup({})
    end,
}
require('mason-lspconfig').setup {
    ensure_installed = { 'pyright', 'clangd', 'bashls', 'lua_ls'},
}

zero = require('lsp-zero').preset({})
zero.on_attach(function(client, bufnr)
  zero.default_keymaps({buffer = bufnr})
end)
zero.setup()

