local lspconfig = require("lspconfig")
lspconfig.clangd.setup({})
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			workspace = {
				library = vim.tbl_extend(
					"keep",
					{ "/usr/lib/lua-language-server/meta/template" },
					vim.api.nvim_get_runtime_file("", true)
				),
			},
		},
	},
})
