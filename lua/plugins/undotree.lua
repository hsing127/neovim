return {
  "mbbill/undotree",
  config = function()
    -- Toggle undotree with <leader>u
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
  end,
}
