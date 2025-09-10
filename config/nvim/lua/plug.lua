-- [[ plug.lua ]]
-- vim.o.packpath
-- ~/.local/share/nvim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  use 'shaunsingh/nord.nvim'
  use 'iberianpig/tig-explorer.vim'
  use {                                              -- filesystem navigation
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',        -- filesystem icons
  config = function() 
    require('nvim-tree').setup({
      view = {
        width = 20,
        signcolumn = "no"

      },
      filters = {
        dotfiles = false
      }
    })
  end,
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'nord',
          disabled_filetypes = { 'NvimTree', 'packer' }
        }
      })
    end,
  }
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- LSP Support
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'neovim/nvim-lspconfig'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
		}
	}
   use {
    'nvim-lua/plenary.nvim'
  }
  use {
    'github/copilot.vim',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  }
  use {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'github/copilot.vim' },  -- Alternatively, use 'zbirenbaum/copilot.lua'
    },
    build = 'make tiktoken',  -- Only on macOS or Linux
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
