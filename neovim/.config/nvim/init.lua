local function initialize()
	local rocks_path = vim.fs.joinpath(vim.fn.stdpath("data"), "rocks")

	local luarocks_path = {
		vim.fs.joinpath(rocks_path, "share", "lua", "5.1", "?.lua"),
		vim.fs.joinpath(rocks_path, "share", "lua", "5.1", "?", "init.lua"),
	}
	package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

	local luarocks_cpath = {
		vim.fs.joinpath(rocks_path, "lib", "lua", "5.1", "?.so"),
		vim.fs.joinpath(rocks_path, "lib32", "lua", "5.1", "?.so"),
	}
	package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

	vim.opt.runtimepath:append(vim.fs.joinpath(rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*"))
end

local function install()
	if not pcall(require, "rocks") then
		local rocks_path = vim.fs.joinpath(vim.fn.stdpath("cache"), "rocks.nvim")

		if not vim.uv.fs_stat(rocks_path) then
			local url = "https://github.com/nvim-neorocks/rocks.nvim"
			vim.fn.system({ "git", "clone", "--filter=blob:none", url, rocks_path })
			assert(vim.v.shell_error == 0, "Failed to clone rocks.nvim.")
		end

		vim.cmd.source(vim.fs.joinpath(rocks_path, "bootstrap.lua"))

		vim.fn.delete(rocks_path)
	end
end

initialize()
install()

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = event.buf }
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
	end,
})
