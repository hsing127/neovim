return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, { desc = 'LSP Rename' })
    end
  }
}
