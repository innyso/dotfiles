local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = true }),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  },
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
