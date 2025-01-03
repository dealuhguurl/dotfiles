require('render-markdown').setup({
    render_modes = true,
    heading = {
        sign = false,
        icons = { '󰴈 ', '󰴈 ', },
        position = 'inline',
    },
    code = {
        width = 'block',
        left_pad = 2,
        right_pad = 2,
    },
    link = {
        enabled = true,
        footnote = {
            superscript = true,
            prefix = '',
            suffix = '',
        },
        image = '󰥶 ',
        email = '󰀓 ',
        hyperlink = '󰌹 ',
        highlight = 'RenderMarkdownLink',
        wiki = { icon = '󱗖 ', highlight = 'RenderMarkdownWikiLink' },
        custom = {
            web = { pattern = '^http[s]?://', icon = '󰖟 ',
                    highlight = 'RenderMarkdownLink',
            },
        },
    },
    bullet = {
        enabled = true,
        icons = { '●', '○', '◆', '◇' },
        ordered_icons = function(level, index, value)
            value = vim.trim(value)
            local value_index = tonumber(value:sub(1, #value - 1))
            return string.format('%d.', value_index > 1 and value_index or index)
        end,
        left_pad = 0,
        right_pad = 0,
        highlight = 'RenderMarkdownBullet',
    },
    checkbox = {
        unchecked = { icon = '✘ ' },
        checked = { icon = '✔ ' },
        custom = { todo = { rendered = '◯ ' } },
    },
    sign = { enabled = false },
})
