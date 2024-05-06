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
  use {                                              -- filesystem navigation
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'shaunsingh/nord.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
