require('render-markdown').setup({
    render_modes = true,
    heading = {
        sign = false,
        icons = { '  ',},
        position = 'inline',
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
})
