return {
  {
    "tpope/vim-fugitive",
    config = function()
      -- Open git status on the left with <leader>gs
      vim.keymap.set("n", "<leader>gs", function()
        vim.cmd("topleft vertical Git")
        vim.api.nvim_win_set_width(0, 40)
      end, { desc = "Git Status" })
      
      -- In fugitive buffer, remap Enter to open diff view
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "fugitive",
        callback = function()
          local bufnr = vim.api.nvim_get_current_buf()
          -- Press Enter to open diff in vertical split
          vim.keymap.set("n", "<CR>", "dv", { buffer = bufnr, remap = true, desc = "Open diff" })
        end,
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
    end
  }
}
