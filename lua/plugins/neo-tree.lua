return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
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
			},
			window = {
				position = "right", -- open Neo-tree on the right side
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
