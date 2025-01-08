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
--cmd.colorscheme "cyberdream"
--cmd.colorscheme "monokai"

-- Custom Colorscheme
vim.cmd('highlight Normal guibg=#16181A guifg=#D1D4D6')
vim.cmd('highlight Comment guifg=#5B6268')
vim.cmd('highlight String guifg=#A9B7C6')
vim.cmd('highlight Keyword guifg=#C792EA')
vim.cmd('highlight Constant guifg=#FFCB6B')
vim.cmd('highlight Identifier guifg=#82AAFF')
vim.cmd('highlight Type guifg=#F78C6C')
vim.cmd('highlight Function guifg=#C3E88D')
vim.cmd('highlight LineNr guifg=#4B5263')
vim.cmd('highlight CursorLine guibg=#2E2E2E')
vim.cmd('highlight Search guibg=#F2D92F guifg=#16181A')
vim.cmd('highlight Visual guibg=#3E4451')
vim.cmd('highlight StatusLine guibg=#2E2E2E guifg=#D1D4D6')
vim.cmd('highlight StatusLineNC guibg=#16181A guifg=#5B6268')
