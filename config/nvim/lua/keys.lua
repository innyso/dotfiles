--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

map('n', '<leader>n', ':set invnumber<CR>', { desc = 'enable and disable line numbers'})

map('n', '<leader>pp', ':set paste!', { desc = 'toggle paste mode'})

map('i', 'jj', '<esc>', {})

-- search
map('n', '<space>', '/', { desc = 'use space for search' })
map('n', '<leader><CR>', ':noh<CR>', { desc = 'remove search highlight' })

-- buffer
map('n', '<right>', ':bnext!<CR>', { desc = 'use right arrow to navigate to next buffer' })
map('n', '<left>', ':bprevious!<CR>', { desc = 'use left arrow to navigate to previous buffer' })
map('n', '<down>', ':buffers<CR>', { desc = 'use left arrow to navigate to previous buffer' })

-- navigate between windows
map('n', '<C-j>', '<C-W>j',{})
map('n', '<C-k>', '<C-W>k',{})
map('n', '<C-h>', '<C-W>h',{})
map('n', '<C-l>', '<C-W>l',{})
map('n', '<C-n>', ':tabnext<CR>', { noremap = true})

-- split size
map('n', '<C-a>', '<C-w>>',{noremap = true})
map('n', '<C-d>', '<C-w>=',{noremap = true})

-- folds
map('n', '<leader>d', ':%foldopen!<CR>', { desc = 'open all folds'})
map('n', '<leader>c', ':%foldclose!<CR>', { desc = 'close all folds'})

-- nvim-tree
map('n','<leader>t', ':NvimTreeToggle<CR>',{})

-- telescope
map('n', '<C-p>',':Telescope find_files<CR>',{})

-- tig
map('n', '<leader>gl', ':Tig<CR>', {})
map('n', '<leader>gs', ':Tig status<CR>', {})
