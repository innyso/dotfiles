local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
end

require('nvim-tree').setup{
  on_attach = my_on_attach,
  view = {
    width = 20,
    signcolumn = "no",
  },
  filters = {
    dotfiles = false
  }
}
