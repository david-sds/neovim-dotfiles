-- ================================================================================================
-- TITLE : efm-langserver
-- ABOUT : a general purpose language server protocol implemented here for linters/formatters
-- LINKS :
--   > github : https://github.com/mattn/efm-langserver
--   > configs: https://github.com/creativenull/efmls-configs-nvim/tree/main
-- ================================================================================================

--- @param lspconfig table The lspconfig module from nvim-lspconfig plugin
--- @param capabilities table LSP client capabilities (from nvim-cmp)
--- @param on_attach function Callback function executed when LSP attaches to a buffer
--- @return nil
return function(lspconfig, capabilities, on_attach)
	local luacheck = require("efmls-configs.linters.luacheck") -- lua linter
	local stylua = require("efmls-configs.formatters.stylua") -- lua formatter

	lspconfig.efm.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"lua",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
			},
		},
	})
end
