-- Copilot Chat configuration
vim.api.nvim_set_keymap('n', '<leader>cc', '<cmd>lua require("CopilotChat").toggle()<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>cc', ':CopilotChat<CR>', { noremap = true, silent = true })
vim.opt.splitright = true

require("CopilotChat").setup({
  context = "files",
  show_help = 'yes',
  window = {
    relative = 'cursor',
    width = 0.5,
    height = 0.5,
    title = "Copilot Chat",
    footer = "Press q to close",
  },
  mappings = {
    submit = "<CR>",
    complete = {
      insert = '<C-Space>',
    },
  },
  name = "CopilotChat",
  prompts = {
    name = "Prompts",
  },
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'  -- Prevent automatic selection
  },
})
