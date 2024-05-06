--[[ init.lua ]]

-- LEADER
vim.g.mapleader = ","
vim.g.localleader = ","

-- PLUGINS: setup
require('nvim-tree').setup({
  view = {
    width = 20,
    signcolumn = "no"

  },
  filters = {
    dotfiles = false
  }
})

vim.g.nord_contrast = true
vim.g.nord_disable_background = true
require('nord').set()
vim.cmd('colorscheme nord')

require('lualine').setup{
  options = {
    theme = 'nord',
    disabled_filetypes = { 'NvimTree', 'packer' }
  }
}

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins
