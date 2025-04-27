vim.g.mapleader = " " -- set <space> key as leader key
vim.g.maplocalleader = "," -- set <space> key as local leader key

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Keymaps
-- Allow clipboard copy paste in neovim
-- map("", "<C-v>", "+p<CR>", opts)
-- map("!", "<C-v>", "<C-R>+", opts)
-- map("t", "<C-v>", "<C-R>+", opts)
-- map("v", "<C-v>", "<C-R>+", opts)

-- Open Lazy
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Open Lazy" })

-- Open Mason
map("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Open Mason" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- cancel highlight search result
map("n", "<leader>n", "<cmd>noh<cr>", { desc = "Cancel Search highlight" })

-- Toggle Symbols Outline
map("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "Open Outline" })
map("n", "<leader>lf", "<cmd>Lspsaga finder<cr>", { desc = "Find References" })
map("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", { desc = "Rename" })

-- set KeyBind for BufferLine
map("n", "<leader>bp", "<cmd>BufferLinePick <cr>", { desc = "Go to Picked Buffer" }) -- go to a specific buffer
map("n", "<leader>bc", "<cmd>BufferLinePickClose <cr>", { desc = "Close picked buffer" }) -- close a specific buffer
map("n", "<leader>bo", "<cmd>BufferLineCloseOthers <cr>", { desc = "Close other buffers" }) -- close other buffers

-- set choose buffer by cycle next
map("n", "<leader><tab>", "<cmd>BufferLineCycleNext <cr>", { desc = "Buffer Cycle Next" })

-- set choose buffer by number
map("n", "<leader>b1", "<cmd>BufferLineGoToBuffer 1 <cr>", { desc = "Go to buffer 1" })
map("n", "<leader>b2", "<cmd>BufferLineGoToBuffer 2 <cr>", { desc = "Go to buffer 2" })
map("n", "<leader>b3", "<cmd>BufferLineGoToBuffer 3 <cr>", { desc = "Go to buffer 3" })
map("n", "<leader>b4", "<cmd>BufferLineGoToBuffer 4 <cr>", { desc = "Go to buffer 4" })
map("n", "<leader>b5", "<cmd>BufferLineGoToBuffer 5 <cr>", { desc = "Go to buffer 5" })

-- Navigate vim panes better
map("n", "<c-k>", "<cmd>wincmd k<cr>", opts)
map("n", "<c-j>", "<cmd>wincmd j<cr>", opts)
map("n", "<c-h>", "<cmd>wincmd h<cr>", opts)
map("n", "<c-l>", "<cmd>wincmd l<cr>", opts)

-- set terminal toggle
map("n", "<leader>`", "<cmd>Lspsaga term_toggle<cr>", { desc = "Toggle Terminal" })
map("t", "<leader>`", [[<cmd>Lspsaga term_toggle<cr>]], opts)

-- set shortcut for Neotree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })

-- set shortcut for LSP
map("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", { desc = "Code Action" })

-- CodeSnap keymaps in visual mode
map("v", "<leader>cc", "<cmd>CodeSnap<cr>", { desc = "Codesnap to clipboard" })
map("v", "<leader>cs", "<cmd>CodeSnapSave<cr>", { desc = "Save snapshot in ~/Pictures" })

-- set dismiss noice message
map("n", "<leader>un", "<cmd>NoiceDismiss<cr>", { desc = "Dismiss Noice Messages" })

-- Git Stuffs keymaps
-- set get preview code with gitsigns
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk <cr>", { desc = "Preview Hunk" })
-- open LazyGit
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Open Lazygit" })
-- open Telescope git repos
map("n", "<leader>gr", function()
	require("telescope").extensions.lazygit.lazygit()
end, { desc = "Show Historical Repos" })

-- set telescope keymaps
map("n", "<leader>fb", "<cmd>Telescope buffers <cr>", { desc = "Find Buffers (Telescope)" })
map("n", "<leader>fh", "<cmd>Telescope help_tags <cr>", { desc = "Find Help (Telescope)" })
map("n", "<leader>ff", "<cmd>Telescope find_files <cr>", { desc = "Find Files (Telescope)" })
map("n", "<leader>fg", "<cmd>Telescope live_grep <cr>", { desc = "live grep (Telescope)" })
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Todo List (Telescope)" })
map(
	"n",
	"<leader>fc",
	"<cmd>lua require('telescope.builtin').find_files{vim.fn.stdpath('config')}<cr>",
	{ desc = "Find Config (Telescope)" }
)

-- debugging keymaps
map("n", "<leader>dt", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", "<cmd>DapContinue<cr>", { desc = "Dap Continue" })

-- UndoTree keymaps
map("n", "<leader>Ut", "<cmd>UndotreeToggle<cr>", { desc = "Toggle UndoTree" })
map("n", "<leader>Uf", "<cmd>UndotreeFocus<cr>", { desc = "Focus on UndoTree" })

-- Trouble keymaps
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle Trouble" }) -- Toggle Trouble
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" }) -- Toggle Quickfix Trouble
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble) " }) -- Toggle Loclist Trouble
map(
	"n",
	"<leader>xt",
	"<cmd>Trouble todo focus toggle filter = {tag = {TODO,FIX,FIXME,NOTE}}<cr>",
	{ desc = "Todo List (Trouble)" }
)
map("n", "gR", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "Toggle LSP References" }) -- Toggle LSP References

-- Zoxide
map("n", "<leader>Z", function()
	require("telescope").extensions.zoxide.list()
end, { desc = "Zoxide" })

-- Neorg keymaps
-- New Neorg Note
map(
	"n",
	"<localleader>nn",
	"<cmd>lua require('neorg.core').dirman.new.note()<cr>",
	{ desc = "[neorg] Create New Note" }
)

-- Metadata
map("n", "<localleader>im", "<cmd>Neorg inject-metadata<cr>", { desc = "[neorg] Inject Metadata" })
map("n", "<localleader>id", "<cmd>lua require('neorg.core').tempus.insert-date()<cr>", { desc = "[neorg] Insert Date" })
map("n", "<localleader>u", "<cmd>Neorg update-metadata<cr>", { desc = "[neorg] Update Metadata" })
-- Table of contents
map("n", "<localleader>c", "<cmd>Neorg toc<cr>", { desc = "[neorg] Table of Contents" })
-- Journal
map("n", "<localleader>jc", "<cmd>Neorg journal toc<cr>", { desc = "[neorg] Journal Table of Contents" })
map("n", "<localleader>jC", "<cmd>Neorg journal custom<cr>", { desc = "[neorg] New Journal Custom" })
map("n", "<localleader>jt", "<cmd>Neorg journal today<cr>", { desc = "[neorg] Journal Today" })
map("n", "<localleader>jT", "<cmd>Neorg journal tomorrow<cr>", { desc = "[neorg] Journal Tomorrow" })
map("n", "<localleader>jy", "<cmd>Neorg journal yesterday<cr>", { desc = "[neorg] Journal Yesterday" })

-- List
map(
	"n",
	"<localleader>li",
	"<cmd>lua require('neorg.core').pivot.invert-list-type()<cr>",
	{ desc = "[neorg] Invert (Un)ordered List" }
)
map(
	"n",
	"<localleader>lt",
	"<cmd>lua require('neorg.core').pivot.toggle-list-type()<cr>",
	{ desc = "[neorg] Toggle (Un)ordered List" }
)

-- Todo tasks
map(
	"n",
	"<localleader>ta",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_ambiguous()<cr>",
	{ desc = "[neorg] Mark as ambiguous" }
)
map(
	"n",
	"<localleader>tc",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_cancelled()<cr>",
	{ desc = "[neorg] Mark as cancelled" }
)
map(
	"n",
	"<localleader>td",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_done()<cr>",
	{ desc = "[neorg] Mark as done" }
)
map(
	"n",
	"<localleader>th",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_on_hold()<cr>",
	{ desc = "[neorg] Mark as on hold" }
)
map(
	"n",
	"<localleader>ti",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_important()<cr>",
	{ desc = "[neorg] Mark as important" }
)
map(
	"n",
	"<localleader>tp",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_pending()<cr>",
	{ desc = "[neorg] Mark as pending" }
)
map(
	"n",
	"<localleader>tr",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_recurring()<cr>",
	{ desc = "[neorg] Mark as recurring" }
)
map(
	"n",
	"<localleader>tu",
	"<cmd>lua require('neorg.core').qol.todo_items.todo.task_undone()<cr>",
	{ desc = "[neorg] Mark as undone" }
)

-- Export markdown file
map("n", "<localleader>ef", "<cmd>Neorg export to-file<cr>", { desc = "[neorg] Export tofile" })
map("n", "<localleader>ed", "<cmd>Neorg export directory<cr>", { desc = "[neorg] Export to directory" })

-- Neorg mode
map("n", "<localleader>mn", "<cmd>Neorg mode norg<cr>", { desc = "[neorg] Enter Norg Mode" })
map("n", "<localleader>mh", "<cmd>Neorg mode traverse-heading<cr>", { desc = "[neorg] Heading Traversal Mode" })
map("n", "<localleader>ml", "<cmd>Neorg mode traverse-link<cr>", { desc = "[neorg] Enter Link Traversal Mode" })

-- toggle showing inlay_hint
map("n", "<leader>ch", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle Inlay Hints" })

-- toggle highlight-color
map("n", "<leader>uc", "<cmd>HighlightColors Toggle<cr>", { desc = "Toggle HighlightColors" })

-- Crates keymaps
-- NOTE: Only use those keymaps when you open a crates.toml file

vim.keymap.set("n", "<leader>Ct", "<cmd>lua require('crates').toggle()<cr>", { desc = "Toggle Crates" })
vim.keymap.set("n", "<leader>Cr", "<cmd>lua require('crates').reload()<cr>", { desc = "Reload Crates" })

vim.keymap.set(
	"n",
	"<leader>Cv",
	"<cmd>lua require('crates').show_versions_popup()<cr>",
	{ desc = "Show Versions Popup" }
)
vim.keymap.set(
	"n",
	"<leader>Cf",
	"<cmd>lua require('crates').show_features_popup()<cr>",
	{ desc = "Show Features Popup" }
)
vim.keymap.set(
	"n",
	"<leader>Cd",
	"<cmd>lua require('crates').show_dependencies_popup()<cr>",
	{ desc = "Show Dependencies Popup" }
)

vim.keymap.set("n", "<leader>Cu", "<cmd>lua require('crates').update_crate()<cr>", { desc = "update crate" })
vim.keymap.set("v", "<leader>Cu", "<cmd>lua require('crates').update_crates()<cr>", { desc = "update crates" })
vim.keymap.set("n", "<leader>Ca", "<cmd>lua require('crates').update_all_crates()<cr>", { desc = "update all crates" })
vim.keymap.set("n", "<leader>CU", "<cmd>lua require('crates').upgrade_crate()<cr>", { desc = "upgrade crate" })
vim.keymap.set("v", "<leader>CU", "<cmd>lua require('crates').upgrade_crates()<cr>", { desc = "upgrade crates" })
vim.keymap.set(
	"n",
	"<leader>CA",
	"<cmd>lua require('crates').upgrade_all_crates()<cr>",
	{ desc = "upgrade all crates" }
)

vim.keymap.set(
	"n",
	"<leader>Cx",
	"<cmd>lua require('crates').expand_plain_crate_to_inline_table()<cr>",
	{ desc = "expand crate" }
)
vim.keymap.set(
	"n",
	"<leader>CX",
	"<cmd>lua require('crates').extract_crate_into_table()<cr>",
	{ desc = "extract crate" }
)

vim.keymap.set("n", "<leader>CH", "<cmd>lua require('crates').open_homepage()<cr>", { desc = "open homepage" })
vim.keymap.set("n", "<leader>CR", "<cmd>lua require('crates').open_repository()<cr>", { desc = "open repository" })
vim.keymap.set(
	"n",
	"<leader>CD",
	"<cmd>lua require('crates').open_documentation()<cr>",
	{ desc = "open documentation" }
)
vim.keymap.set("n", "<leader>CC", "<cmd>lua require('crates').open_crates_io()<cr>", { desc = "open crates.io" })
