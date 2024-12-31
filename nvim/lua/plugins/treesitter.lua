require("nvim-treesitter.configs").setup {
    -- auto install missing parser
    ensure_installed = { "markdown", "markdown_inline" },
    auto_install = false,
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
