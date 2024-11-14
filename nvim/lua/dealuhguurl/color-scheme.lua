local decay = require("decay")

local opt = vim.opt
local cmd = vim.cmd

opt.background = "dark"

decay.setup({
  style = "dark",

  -- enables italics in code keywords & comments.
  italics = {
    code = false,
    comments = false,
  },

  -- enables contrast when using nvim tree.
  nvim_tree = {
    contrast = true
  },
})

cmd.colorscheme "decay"
