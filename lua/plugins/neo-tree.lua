return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	lazy = true,  -- Don't load Neo-tree automatically
	keys = {
		{ "<C-n>", ":Neotree filesystem reveal toggle<CR>", desc = "Toggle Neo-tree" },
		{ "<leader>bf", ":Neotree buffers reveal float<CR>", desc = "Neo-tree buffers" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true, -- show hidden files by default
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				follow_current_file = {
					enabled = true, -- highlights current file in tree
				},
				hijack_netrw_behavior = "disabled",  -- Don't hijack directory viewing
			},
			window = {
				position = "right",
				width = 30, -- open Neo-tree on the right side
			},
		})
	end,
}
