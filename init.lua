local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load keymaps configuration
require("core.keymaps")

-- Load options configuration
require("core.options")

-- Load Neovide configuration
require("core.neovide")

-- Load autocmd configuration
require("core.autocmd")

-- import plugins, and the file location is `nvim/lua/plugins`
local lazy_config = {
	spec = { import = "plugins" },
	checker = {
		enabled = true,
	},
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"netrwPlugin",
			},
		},
	},
}

require("lazy").setup(lazy_config)
