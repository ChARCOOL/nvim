local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("akinsho/bufferline.nvim")
	use("andymass/vim-matchup")
	use("folke/todo-comments.nvim")
	use("folke/tokyonight.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("kyazdani42/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")
	use("lewis6991/gitsigns.nvim")
	use("lewis6991/impatient.nvim")
	use("NvChad/nvim-colorizer.lua")
	use("nvim-lua/plenary.nvim")
	use("nvim-lualine/lualine.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/playground")
	use("stevearc/dressing.nvim")
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use({ "neoclide/coc.nvim", branch = "release" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
