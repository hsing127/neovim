vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"
vim.cmd("set clipboard=unnamed")

-- File handling
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Undo persistence - keep undo history after closing files
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Search improvements
vim.opt.ignorecase = true  -- Case-insensitive search
vim.opt.smartcase = true   -- Unless uppercase is used

-- Scroll offset - keep cursor away from edges
vim.opt.scrolloff = 8      -- Keep 8 lines visible above/below cursor
vim.opt.sidescrolloff = 8  -- Keep 8 columns visible left/right

-- Better splits - open in intuitive directions
vim.opt.splitright = true  -- Vertical splits go right
vim.opt.splitbelow = true  -- Horizontal splits go below

-- Line numbers
vim.wo.number = true
vim.opt.relativenumber = true

-- Clear search highlight
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Map option+hjkl to arrow keys (so they don't change modes)
-- In insert mode, option+hjkl moves cursor without leaving insert mode
vim.keymap.set('i', '<M-h>', '<Left>', { noremap = true, desc = "Move left (stay in insert)" })
vim.keymap.set('i', '<M-j>', '<Down>', { noremap = true, desc = "Move down (stay in insert)" })
vim.keymap.set('i', '<M-k>', '<Up>', { noremap = true, desc = "Move up (stay in insert)" })
vim.keymap.set('i', '<M-l>', '<Right>', { noremap = true, desc = "Move right (stay in insert)" })

-- In normal mode, option+hjkl acts like arrow keys (single character movement)
vim.keymap.set('n', '<M-h>', '<Left>', { noremap = true, desc = "Move left" })
vim.keymap.set('n', '<M-j>', '<Down>', { noremap = true, desc = "Move down" })
vim.keymap.set('n', '<M-k>', '<Up>', { noremap = true, desc = "Move up" })
vim.keymap.set('n', '<M-l>', '<Right>', { noremap = true, desc = "Move right" })

-- In visual mode, option+hjkl extends selection like arrow keys
vim.keymap.set('v', '<M-h>', '<Left>', { noremap = true, desc = "Extend selection left" })
vim.keymap.set('v', '<M-j>', '<Down>', { noremap = true, desc = "Extend selection down" })
vim.keymap.set('v', '<M-k>', '<Up>', { noremap = true, desc = "Extend selection up" })
vim.keymap.set('v', '<M-l>', '<Right>', { noremap = true, desc = "Extend selection right" })

-- Disable default 's' (substitute) to allow mini.surround to use it
-- Use 'cl' instead of 's' for substitute character (does the same thing)
vim.keymap.set('n', 's', '<Nop>', { noremap = true, desc = "Disabled (use cl for substitute)" })
vim.keymap.set('n', 'S', '<Nop>', { noremap = true, desc = "Disabled (use cc for substitute line)" })

-- Terminal mode mappings - escape terminal mode with Esc
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, desc = "Exit terminal mode" })
-- Also allow Ctrl+hjkl to work in terminal mode for window navigation
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-h>', { noremap = true, desc = "Go to left window" })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-j>', { noremap = true, desc = "Go to below window" })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-k>', { noremap = true, desc = "Go to above window" })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-l>', { noremap = true, desc = "Go to right window" })
