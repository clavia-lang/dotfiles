return {
	{
		"mrcjkb/rustaceanvim",
		ft = "rust",
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.clangd.setup({})
			lspconfig.zls.setup({})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = function()
			local cmp = require("cmp")
			return {
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
				}),

			}
		end,
		config = function(_, opts)
			local cmp = require("cmp")
			cmp.setup(opts)
		end,
	},
}
