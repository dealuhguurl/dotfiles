-- Highlight current line i'm on 
opt.cursorline = true

-- Indents & spacing
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Set numbers 
cmd.set "number"

-- Removes EndOfBuffer tilda symbols
opt.fillchars = {eob =" "}

-- True colors
opt.termguicolors = true

-- Remove startup text 
cmd.set "shortmess=I"

-- Disable statusline
cmd.set "laststatus=0"

-- Filetype indent
cmd.filetype "plugin indent on"

-- Colorscheme
--cmd.colorscheme "poimandres"
