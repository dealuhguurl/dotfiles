local async = require "plenary.async"
local builtin = require("telescope.builtin")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

require("telescope").setup {
    defaults = {
        prompt_prefix = " ",
        --selection_caret = " ",
        selection_caret = " ",
        --sortring_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.00,
            },
            width = 0.50,
            height = 0.50,
        },
        mappings = {
            i = { ["q"] = require("telescope.actions").close },
        },
    },
    pickers = {},
    extensions = {}
}




