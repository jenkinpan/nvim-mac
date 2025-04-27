return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				style = "moon", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
				light_style = "day", -- The theme is used when the background is set to light
				transparent = false, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
				day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				dim_inactive = false, -- dims inactive windows
				lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
				use_background = true, -- can be light/dark/auto. When auto, background will be set to vim.o.background

				cache = true, -- When set to true, the theme will be cached for better performance

				---@type table<string, boolean|{enabled:boolean}>
				plugins = {
					-- enable all plugins when not using lazy.nvim
					-- set to false to manually enable/disable plugins
					all = package.loaded.lazy == nil,
					auto = true,
				},
			})
			vim.cmd.colorscheme("tokyonight-moon")
		end,
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	event = "VimEnter",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			flavour = "frappe",
	-- 			background = {
	-- 				light = "frappe",
	-- 				dark = "mocha",
	-- 			},
	-- 			styles = {
	-- 				comments = { "italic" },
	-- 				conditionals = { "italic" },
	-- 			},
	-- 		})
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },
}
