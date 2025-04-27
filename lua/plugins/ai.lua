return {
	{ -- A free AI code-completion engine
		"Exafunction/codeium.nvim",
		event = "InsertEnter",
		config = function()
			require("codeium").setup({
				enable_chat = true,
			})
		end,
	},
}
