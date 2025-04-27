return {
	{ "nvim-neotest/nvim-nio", lazy = true },
	{ "mfussenegger/nvim-dap-python", lazy = true },
	{ "rcarriga/nvim-dap-ui", lazy = true },
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			require("dapui").setup()
			require("dap-python").setup()

			local codelldb = require("mason-registry").get_package("codelldb"):get_install_path() .. "/codelldb"

			dap.adapters.lldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = codelldb,
					args = { "--port", "${port}" },
				},
			}

			dap.configurations.cpp = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
					runInTerminal = false,
				},
			}

			dap.configurations.c = dap.configurations.cpp

			dap.configurations.rust = dap.configurations.cpp

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
