local opt = vim.opt 
local cmd = vim.cmd

-- colorscheme
local decay = require("decay")
opt.background = "dark"
decay.setup({
    style = "dark",
    italics = {
        code = false,
        comments = false,
    },
})
cmd.colorscheme "decay-dark"

-- indents and spacing
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.hlsearch = false
opt.incsearch = true
opt.relativenumber = false
opt.updatetime = 50
opt.fillchars = {eob = " "}
opt.termguicolors = true
cmd.set "shortmess=I"

