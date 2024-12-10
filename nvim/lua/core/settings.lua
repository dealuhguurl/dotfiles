-- Highlight current line i'm on 
opt.cursorline = true

-- Indents & spacing
opt.tabstop = 4
opt.shiftwidth = 4
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

-- Set 2 spaces for Lua files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.bo.tabstop = 2       -- Set tab width to 2 spaces
    vim.bo.shiftwidth = 2     -- Set indentation width to 2 spaces
    vim.bo.expandtab = true   -- Use spaces instead of tabs
  end,
})

