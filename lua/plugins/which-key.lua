return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
	config = function()
		local wk = require("which-key")
		wk.setup({
			plugins = {
				spelling = {
					enabled = true,
					suggestions = 20,
				},
			},
		})

		wk.add({
			{ "<leader>C", group = "Crates" },
			{ "<leader>U", group = "Undo Tree" },
			{ "<leader>a", group = "AI" },
			{ "<leader>b", group = "Buffers" },
			{ "<leader>c", group = "Code Actions" },
			{ "<leader>d", group = "Debug" },
			{ "<leader>f", group = "Telescope" },
			{ "<leader>g", group = "Git Stuffs" },
			{ "<leader>l", group = "Lspsaga" },
			{ "<leader>q", group = "quit/session" },
			{ "<leader>u", group = "UI" },
			{ "<leader>x", group = "Trouble" },
			{ "<localleader>e", group = "[neorg] Export" },
			{ "<localleader>i", group = "[neorg] Insert" },
			{ "<localleader>j", group = "[neorg] Journal" },
			{ "<localleader>l", group = "[neorg] List" },
			{ "<localleader>m", group = "[neorg] Mode" },
			{ "<localleader>n", group = "[neorg] New" },
			{ "<localleader>t", group = "[neorg] Todo Tasks" },
			{ "gs", group = "surround" },
		})
	end,
}
