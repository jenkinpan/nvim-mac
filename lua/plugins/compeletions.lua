return {
	{
		-- set for rust crates
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {
			completion = {
				cmp = { enabled = true },
			},
		},
		config = function()
			require("crates").setup()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"windwp/nvim-autopairs", -- autopairs
			"onsails/lspkind.nvim", -- pictogram icons for lsp/autocompletion
			"hrsh7th/cmp-cmdline", -- cmdline completion
			{
				"zbirenbaum/copilot-cmp",
				config = function()
					require("copilot_cmp").setup({})
				end,
			},
		},
		config = function()
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			require("nvim-autopairs").setup()

			-- Integrate nvim-autopairs with cmp
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

			-- load snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-c>"] = cmp.mapping.abort(), -- cancel completion window
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", max_item_count = 5, group_index = 2 }, -- LSP source
					{ name = "codeium", group_index = 0 }, -- codeium source
					{ name = "copilot", group_index = 0 }, -- copilot source
					{ name = "buffer", max_item_count = 5 }, -- text with current buffer
					{ name = "path", max_item_count = 5, group_index = 2 }, -- file system paths
					{ name = "luasnip", max_item_count = 5, group_index = 2 }, -- snippets
					{ name = "neorg" }, -- set neorg completion source
					{ name = "crates" }, -- set rust crates
				}),
				-- Enable pictogram icons for lsp/autocompletion
				formatting = {
					expandable_indicator = true,
					format = function(entry, item)
						local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
						item = lspkind.cmp_format({
							-- lspkind format settings
							mode = "symbol_text",
							maxwidth = 50,
							ellipsis_char = "...",
							symbol_map = {
								Copilot = "",
								Codeium = "",
							},
						})(entry, item)
						if color_item.abbr_hl_group then
							item.kind_hl_group = color_item.abbr_hl_group
							item.kind = color_item.abbr
						end
						return item
					end,
				},
			})

			-- `:` cmdline completion setup.
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})
		end,
	},
}
