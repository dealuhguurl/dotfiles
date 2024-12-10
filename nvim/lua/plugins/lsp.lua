local lspconfig = require("lspconfig")
local setlsp = require("plugins.lspconfig")

local servers = {
  "clangd",
  "gopls",
  "lua_ls",
  "rust_analyzer",
  "cssls",
  "html",
  "ts_ls",
  "pyright",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = setlsp.on_attach,
    on_init = setlsp.on_init,
    capabilities = setlsp.capabilities,
  }
end

