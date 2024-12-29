local lspkind = require('lspkind')
local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()

vim.api.nvim_set_hl(0, 'CmpItemKindTextDefault', { link='@markup' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='@function.builtin' })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { link='@function' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { link='@constructor' })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { link='@string' })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { link='@variable' })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { link='@type' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='@lsp.type.interface' })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { link='@module' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='@property' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='@lsp.type.struct' })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { link='@string' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { link='@lsp.type.enum' })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { link='@lsp.type.keyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { link='@error' })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { link='Special' })
vim.api.nvim_set_hl(0, 'CmpItemKindFileDefault', { link='Normal' })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { link='@markup.link' })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { link='Directory' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { link='@lsp.type.enumMember' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { link='@constant' })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { link='@lsp.type.struct' })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { link='Special' })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { link='@operator' })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { link='@lsp.type.typeParameter' })


icons = {
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰫧",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "󰆐",
  Color = "󰏘",
  File = "󰈙",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "",
}

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
      completion = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel",
        side_padding = 0,
        col_offset = -4, -- move floating box left or right
        border = "rounded",
        scrollbar = false,
      },
      documentation = cmp.config.disable
    },
    sources = cmp.config.sources({
        {name = 'luasnip'},
        {name = 'nvim_lsp_signature_help'},
        {name = 'nvim_lsp'},
        {name = 'buffer'},
        {name = 'path'},
    }),
    formatting = {
    format = lspkind.cmp_format {
      mode = 'symbol_text',
      before = function(_entry, vim_item)
        if vim_item.menu ~= nil and string.len(vim_item.menu) > 0 then
          vim_item.menu = string.sub(vim_item.menu, 0, 0) .. ""
        end
        vim_item.kind = (icons[vim_item.kind] or "?") .. "  " .. vim_item.kind
        return vim_item
      end,
    },
  },
})

