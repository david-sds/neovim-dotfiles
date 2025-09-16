local on_attach = require("utils.lsp").on_attach
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Language Server Protocol (LSP)
require("servers.lua_ls")(lspconfig, capabilities, on_attach)

-- Linters & Formatters
require("servers.efm-langserver")(lspconfig, capabilities, on_attach)
