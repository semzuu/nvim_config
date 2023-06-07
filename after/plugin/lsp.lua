local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.setup_servers({'tsserver', 'eslint'})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())



local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({select = true}),
  ['<C-Space>'] = cmp.mapping.complete(),
})
cmp.setup({
 window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }
})

lsp.set_preferences({
  sign_icons = {}
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<leader>d', function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '<leader>dn', function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set('n', '<leader>dp', function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)


lsp.setup()
