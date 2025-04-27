# neovim config profile

use lazy.nvim to manage plugins

## file tree

├── init.lua<br>
├── lua<br>
│   ├── core<br>
│   │   ├── keymaps.lua<br>
│   │   ├── neovide.lua<br>
│   │   └── options.lua<br>
│   └── plugins<br>
└── readme.md<br>

## Installed Plugins

telescope.nvim<br>
nvim-tree<br>
tree-sitter<br>
nvim-lspconfig<br>
mason<br>
conform<br>
noice.nvim<br>
nvim-ufo<br>
Lspsaga<br>
nvim-lint<br>
flash.nvim<br>
neorg<br>
copilot.lua<br>

## KeyBinding

- NORMAL mode

```help
`<leader>n` - cancel search result highlight
`Ctrl+h` - jump to the left split window
`Ctrl+l` - jump to the right split window
`Ctrl+j` - jump to the bottom split window
`Ctrl+k` - jump to the upper split window
```

### KeyBind for Nvim-Tree

- NORMAL mode

```help
`<leader>+e` - Toggle Nvim-Tree on the left side
```

### KeyBind for Telescope

- NORMAL mode

````help
`<leader>ff` - open file find
`<leader>fg` - open live grep window
`<leader>fb` - open find buffer window for current buffers```
````

### KeyBind for Comment

- NORMAL mode

```help
`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`[count]gcc` - Toggles the number of line given as a prefix-count using linewise
`[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comments
```

```help
`gco` - Insert comment to the next line and enters INSERT mode
`gcO` - Insert comment to the previous line and enters INSERT mode
`gcA` - Insert comment to end of the current line and enters INSERT mode
```

- VISUAL mode

```help
`gc` - Toggles the region using linewise comment
`gb` - Toggles the region using blockwise comment
```

### KeyBind for Noice

- NORMAL mode

```help
`<leader>un` - Dsimiss all visible messages
```

### KeyBind for mini.surround

```bash
'gsa' # in visual mode by selecting a code or code block and plus the signal you decided to use.
'gsd' # in normal mode -> first type gsd and type the signal you want to remove.
'gsr' # in normal mode -> first type gsr and type the signal you want to replace and finally type the new signal.
```
