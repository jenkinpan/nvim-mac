return {
	"mfussenegger/nvim-lint",
	event = {
		"BufRead",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "pylint" },
			html = { "htmlhint" },
			javascript = { "eslint" },
			javascriptreact = { "eslint" },
			typescript = { "eslint" },
			typescriptreact = { "eslint" },
			css = { "stylelint" },
			scss = { "stylelint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("Linter", { clear = true })

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
