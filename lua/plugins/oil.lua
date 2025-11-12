return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")
    oil.setup({
      default_file_explorer = true,  -- Make Oil the default file explorer
      view_options = {
        show_hidden = true,  -- Show hidden files by default
      },
    })
    vim.keymap.set("n", "-", oil.toggle_float, {})
  end,
}
