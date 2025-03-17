local install_location = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy", "lazy.nvim")
if not vim.uv.fs_stat(install_location) then
	local url = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", url, install_location })
	assert(vim.v.shell_error == 0, "lazy.nvim installation failed")
end
vim.opt.runtimepath:append(install_location)

vim.opt.cmdheight = 0

require("lazy").setup("plugins")
