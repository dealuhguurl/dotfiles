-- Highlight current line i'm on 
opt.cursorline = true

-- Indents & spacing
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Highlight searched text
opt.hlsearch = true
opt.incsearch = true

-- Relative Numbers
opt.relativenumber = true

-- Remove numbers on left side 
opt.fillchars = {eob =" "}

-- True colors
opt.termguicolors = true

-- Remove startup text 
cmd.set "shortmess=I"

-- Disable statusline = 0, always show status bar =1 
cmd.set "laststatus=0"

-- Filetype indent
cmd.filetype "plugin indent on"

--cmd.colorscheme "tokyonight-night"
