local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use 'lewis6991/impatient.nvim'
  require('impatient')

  use "nvim-lualine/lualine.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "moll/vim-bbye"
  use "akinsho/bufferline.nvim"
  use "lunarvim/darkplus.nvim"
  use {'neoclide/coc.nvim', branch = 'release'}
  use("petertriho/nvim-scrollbar")
  use "folke/tokyonight.nvim"
  use {'kevinhwang91/nvim-hlslens'}
  use 'sudormrfbin/cheatsheet.nvim'
  use 'jbyuki/nabla.nvim'
  use {
    'goolord/alpha-nvim'
}

  use "andymass/vim-matchup" -- extend % to language specific
-- https://github.com/SmiteshP/nvim-gps/issues/59
-- Run :TSInstall python
  use {
	"SmiteshP/nvim-gps",
	requires = "nvim-treesitter/nvim-treesitter"
}

  use "lukas-reineke/indent-blankline.nvim"
  use "karb94/neoscroll.nvim"
  use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
-- better-quickfix: make coc-diagnostics pane look less atrocious
 use {'kevinhwang91/nvim-bqf', ft = 'qf'}

    -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use "nvim-telescope/telescope-project.nvim"

  --use "Shatur/neovim-session-manager"
  -- use "ahmedkhalf/project.nvim"


--  use { 'lewis6991/gitsigns.nvim' }
-- <leader>hb to blame line, ]c & [c to move between hunks (changes)
use {
  'lewis6991/gitsigns.nvim',
  config = function() require('gitsigns').setup() end,
  requires = 'nvim-lua/plenary.nvim',
  tag = 'release',
  event = 'VimEnter', -- https://github.com/lewis6991/gitsigns.nvim/issues/389. Otherwise it produces an error when a :Git buffer is open.
}
use { 'github/copilot.vim' }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
--
--
--
--
--
--
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
