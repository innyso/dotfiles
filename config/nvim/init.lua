--[[ init.lua ]]

-- LEADER
vim.g.mapleader = ","
vim.g.localleader = ","

vim.g.nord_contrast = true
vim.g.nord_disable_background = true
require('nord').set()
vim.cmd('colorscheme nord')

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins
