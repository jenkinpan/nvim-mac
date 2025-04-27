return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"black",
					"rustywind",
					"codelldb",
					"shfmt",
					"htmlhint",
					"beautysh",
					"eslint",
					"rust_analyzer",
					"ts_ls",
					"volar",
					"lua_ls",
					"emmet_ls",
					"markdown_oxide",
					"slint_lsp",
					"biome",
					"tailwindcss",
					"pylsp",
				},
				auto_update = true,
				run_on_start = true,
				start_delay = 300,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					html = { "prettier", "rustywind" },
					lua = { "stylua" },
					javascript = { "biome" },
					typescript = { "biome" },
					typescriptreact = { "prettier" },
					javascriptreact = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },
					markdown = { "prettier" },
					python = { "black" },
					yaml = { "prettier" },
					json = { "biome" },
					vue = { "prettier", "rustywind" },
					sh = { "shfmt" }, -- set formatter for shell
					bash = { "shfmt" }, -- set formatter for bash
					zsh = { "beautysh" }, -- set formatter for zsh
				},
				format_on_save = {
					lsp_fallback = true,
					timeout_ms = 500,
				},
				log_level = vim.log.levels.ERROR,
				notify_on_error = true,
			})
		end,
	},
}
