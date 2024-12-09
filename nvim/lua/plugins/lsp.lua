local on_attach = function(client, bufnr)
    -- Disabling SemanticTokens because it fucks up my colorscheme
    client.server_capabilities.semanticTokensProvider = nil
    local bufopts = {noremap = true, silent = true, buffer = bufnr}
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set(
        "n",
        "<space>f",
        function()
            vim.lsp.buf.format {async = true}
        end,
        bufopts
    )
end

local lsp_flags = {
    debounce_text_changes = 150
}

-- JS/TS
require("lspconfig").ts_ls.setup {
    on_attach = on_attach,
    flags =  lsp_flags,
    cmd = {"typescript-language-server", "--stdio"},
    filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
    single_file_support = true
}

-- C/C++ lsp
require("lspconfig").clangd.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = {
        "clangd",
        "--background-index"
    },
    filetypes = {"c", "cpp", "objc", "objcpp"}
}

-- Python lsp
require("lspconfig").pyright.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = {
        "pyright-langserver",
        "--stdio"
    },
    filetypes = {"python", "py"},
    python = {
        analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true
        }
    }
}
--rust-analyzer.inlayHints.typeHints.enable (default: true)
-- Rust lsp
require("lspconfig").rust_analyzer.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = {"rust-analyzer"},
    filetypes = {"rust", "rs"},
    settings = {
        ["rust-analyzer"] = {
            inlayHints = {
                typeHints = true
            },
            cargo = {
                allFeatures = true
            },
            checkOnSave = {
                command = "clippy"
            },
            diagnostic = {
                enable = true
            },
        }
    }
}

-- Go lsp
require("lspconfig").gopls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = {"gopls"},
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    single_file_support = true,
}

-- Lua lsp
require("lspconfig").lua_ls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = {"lua-language-server"},
    filetypes = {"lua"},
    single_file_support = true,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT"
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
            },
            workspace = {},
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false
            }
        }
    }
}

-- Install HTML, CSS, MARKDOWN, JSON, AND ESLINT LSP;
-- sudo nmp i -g vscode-langservers-extracted
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").html.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = {"vscode-html-language-server", "--stdio"},
    filetypes = {"html"},
    single_file_support = true,
}

require("lspconfig").cssls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {"vscode-css-language-server", "--stdio"},
    filetypes = {"css", "scss", "less"},
    settings = {
        css = {
            validate = true
        },
        less = {
            validate = true
        },
        scss = {
            validate = true
        }
    }
}

