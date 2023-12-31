-- Base config
require('ny.base')

-- Lazy bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Packages
require("lazy").setup({
  -- Autopairs
  "windwp/nvim-autopairs",


  -- Catpuccin theme
  "catppuccin/nvim",

  -- Treesitter
  "nvim-treesitter/nvim-treesitter",

  -- Ctrlp
  {
    "ctrlpvim/ctrlp.vim",
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "lukas-reineke/lsp-format.nvim",
      "lvimuser/lsp-inlayhints.nvim",
    }
  },

  -- Cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      'dcampos/nvim-snippy',
      'dcampos/cmp-snippy',
    }
  },

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  }

})
