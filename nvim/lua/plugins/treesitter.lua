require("nvim-treesitter.configs").setup {
    -- auto install missing parser
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
        }
    },
    indent = {
        enable = false
    }
}

vim.opt.runtimepath:append("$HOME/.local/share/nvim/site/pack/packer/start/nvim-treesitter/parser")
-- This code folds code which is annoying :)
--vim.api.nvim_exec([[
--    set foldmethod=expr
--   set foldexpr=nvim_treesitter#foldexpr()
--]], true)
