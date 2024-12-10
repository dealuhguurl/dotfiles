local lspkind = require('lspkind')
local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
        require('luasnip').lsp_expand(args.body) 
        -- You need Neovim v0.10 to use vim.snippet
        --vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<TAB>'] = cmp.mapping.confirm({select = true}),
    }),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    sources = cmp.config.sources({
        {name = 'luasnip'},
        {name = 'nvim_lsp_signature_help'},
        {name = 'nvim_lsp'},
        {name = 'buffer'},
        {name = 'path'},
    }),
    formatting = {
        format = lspkind.cmp_format({
	    mode = 'symbol_text',
	    maxwidth = {
		    menu = 50,
		    abbr = 50,
	    },
	    ellipsis_char = '...',
	    show_labelDetails = true,
	    before = function (entry, vim_item)
		    return vim_item
	    end
	    })
    }
})

