return {
	{
		"nvim-neorg/neorg",
		ft = "norg", -- lazy load on file type
		cmd = "Neorg", -- lazy load on command
		opts = {
			load = {
				["core.defaults"] = {}, -- Loads default behavior
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.summary"] = {},
				["core.ui"] = {},
				["core.ui.calendar"] = {},
				["core.export"] = {
					config = {
						export_dir = "/home/jenkin/Documents/markdown-export",
					},
				},
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/Documents/notes",
						},
						index = "index.norg",
					},
				},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.qol.toc"] = {
					config = {
						close_after_use = true,
					},
				},
				["core.esupports.metagen"] = {
					config = {
						update_date = true,
					},
				},
			},
		},
	},
}
