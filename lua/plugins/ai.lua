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
	{
		"zbirenbaum/copilot.lua",
		lazy = true,
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		lazy = true,
		event = "InsertEnter",
		branch = "canary",
		opts = {
			window = {
				layout = "float", -- 'vertical', 'horizontal', 'float', 'replace'
				width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
				height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
				-- Options below only apply to floating windows
				relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
				border = "rounded", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
				row = nil, -- row position of the window, default is centered
				col = nil, -- column position of the window, default is centered
				title = "Copilot Chat", -- title of chat window
				footer = nil, -- footer of chat window
				zindex = 1, -- determines if window is on top or below other floating windows
			},
		},
		keys = {
			{ "<leader>ao", "<cmd>CopilotChatOptimize<cr>", desc = "Optimize Selected Code", mode = "v" },
			{ "<leader>af", "<cmd>CopilotChatFix<cr>", desc = "Fix (selected)Code", mode = { "v", "n" } },
			{ "<leader>ad", "<cmd>CopilotChatDocs<cr>", desc = "Add documentation", mode = "v" },
			{
				"<leader>aq",
				function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
					end
				end,
				desc = "Open Quick chat",
			},
			{
				"<leader>ac",
				function()
					require("CopilotChat").open()
				end,
				desc = "Open chat",
			},
			{
				"<leader>at",
				function()
					require("CopilotChat").toggle()
				end,
				desc = "Toggle CopilotChat",
			},
		},
	},
}
