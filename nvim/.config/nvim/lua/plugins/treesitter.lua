return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
		lazy = vim.fn.argc(-1) == 0,
		build = ":TSUpdate",
		opts = {
			auto_install = true,
			ensure_installed = { "nu", "rust" },
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			}
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
		dependencies = {
			"nushell/tree-sitter-nu",
		},
	},
}
