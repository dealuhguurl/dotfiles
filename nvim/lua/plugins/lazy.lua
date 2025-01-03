-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    -- Lsp & Cmp
    {"neovim/nvim-lspconfig"},
    {"williamboman/nvim-lsp-installer"},
    {"hrsh7th/nvim-cmp"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/cmp-nvim-lua"},
    {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-nvim-lsp-signature-help"},
    {"windwp/nvim-autopairs"},
    {"zbirenbaum/nvterm"},
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim"
      }
    },
    -- TreeSitter
    {"nvim-treesitter/nvim-treesitter"},
    -- Telecope & Icons
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim"
      }
    },
    -- Markdown
    {
      "MeanderingProgrammer/render-markdown.nvim",
      dependencies = {
        "echasnovski/mini.nvim"
      },
      opts = {},
    },
    -- ColorScheme
    {"dealuhguurl/poimandres.nvim"},
    {"norcalli/nvim-colorizer.lua"},

  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})
