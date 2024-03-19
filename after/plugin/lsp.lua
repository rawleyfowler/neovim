local lsp = require('lsp-zero')

lsp.preset('recommended')

local lspconfig = require('lspconfig')
lspconfig.ccls.setup {
    init_options = {
        index = { threads = 2 }
    },

    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end
}
-- lspconfig.clangd.setup {}
lspconfig.lua_ls.setup {}
lspconfig.gopls.setup {}
lspconfig.perlnavigator.setup {
    cmd = { "perlnavigator" }
}

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<Tab>'] = cmp_action.luasnip_jump_forward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<C-]>", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<C-[>", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
