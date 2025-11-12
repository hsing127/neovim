vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.g.background = "light"
vim.cmd("set clipboard=unnamed")

-- Editor behavior
vim.opt.smartindent = true      -- Smart auto-indenting for code blocks
vim.opt.wrap = false            -- Don't wrap long lines
vim.opt.termguicolors = true    -- Enable 24-bit RGB colors
vim.opt.signcolumn = "yes"      -- Always show sign column (prevents UI jumping)
vim.opt.updatetime = 50         -- Faster update time for plugins (ms)

-- File handling
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.title = true
vim.opt.titlestring = "%t"   -- filename only

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

-- Reload vim-options without restarting Neovim
vim.keymap.set('n', '<leader>rr', function()
	vim.cmd('luafile ~/.config/nvim/lua/vim-options.lua')
	print("✓ Vim options reloaded!")
end, { desc = "[R]eload vim-options" })

-- Make UI elements more visible on dark backgrounds
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		-- Keep background transparent
		vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
		
		-- Make line numbers lighter and more visible on dark backgrounds
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#c6d0f5", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#e78284", bg = "NONE", bold = true })
		
		-- Make window borders lighter and more visible
		vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#c6d0f5", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "VertSplit", { fg = "#c6d0f5", bg = "NONE", bold = true })
		
		-- Make Telescope borders transparent/lighter
		vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#c6d0f5", bg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#c6d0f5", bg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = "#e78284", bg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#c6d0f5", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#c6d0f5", bg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#c6d0f5", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#c6d0f5", bg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#c6d0f5", bg = "NONE", bold = true })
		
		-- Make Harpoon menu transparent
		vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = "#c6d0f5", bg = "NONE" })
		vim.api.nvim_set_hl(0, "HarpoonWindow", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "HarpoonTitle", { fg = "#c6d0f5", bg = "NONE", bold = true })
		
		-- Make all floating windows transparent
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#c6d0f5", bg = "NONE" })
		vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#c6d0f5", bg = "NONE", bold = true })
	end,
})
