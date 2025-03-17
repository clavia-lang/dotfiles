return {
	{
		"rebelot/kanagawa.nvim",
		build = ":KanagawaCompile",
		-- 修改配置后必须重启Neovim，并运行:KanagawaCompile
		opts = {
			compile = true,
		},
		config = function(_, opts)
			require("kanagawa").setup(opts)
			vim.cmd.colorscheme("kanagawa")
		end,
	},
}
