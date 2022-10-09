return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use("neovim/nvim-lspconfig")

  -- Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Telescope
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")

    -- Themes
	use("gruvbox-community/gruvbox")
	use("folke/tokyonight.nvim")

	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate"
	})
	use("nvim-treesitter/playground")
	use("romgrk/nvim-treesitter-context")

end)
