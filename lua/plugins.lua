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
  use("b0o/SchemaStore.nvim")
  use("folke/todo-comments.nvim")
  use("folke/tokyonight.nvim")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-emoji")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-path")
  use("hrsh7th/nvim-cmp")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("jose-elias-alvarez/null-ls.nvim")
  use("jose-elias-alvarez/typescript.nvim")
  use("kyazdani42/nvim-tree.lua")
  use("kyazdani42/nvim-web-devicons")
  use("L3MON4D3/LuaSnip")
  use("lewis6991/gitsigns.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("neovim/nvim-lspconfig")
  use("norcalli/nvim-colorizer.lua")
  use("nvim-lua/plenary.nvim")
  use("nvim-lualine/lualine.nvim")
  use("nvim-telescope/telescope.nvim")
  use("ray-x/lsp_signature.nvim")
  use("RRethy/vim-illuminate")
  use("saadparwaiz1/cmp_luasnip")
  use("Saecki/crates.nvim")
  use("simrat39/rust-tools.nvim")
  use("stevearc/dressing.nvim")
  use("tpope/vim-commentary")
  use("williamboman/nvim-lsp-installer")
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "tzachar/cmp-tabnine", run = "./install.sh" })

  if packer_bootstrap then
    require("packer").sync()
  end
end)
