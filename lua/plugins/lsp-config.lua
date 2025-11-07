return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "mason.nvim" },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      
      -- Ensure these LSP servers are installed
      mason_lspconfig.setup({
        ensure_installed = {
          "ts_ls",
          "gopls",
          "html",
          "lua_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      
      -- Define server configurations using the new vim.lsp.config API
      local servers = {
        ts_ls = {
          capabilities = capabilities,
          cmd = { "typescript-language-server", "--stdio" },
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
          root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
        },
        gopls = {
          capabilities = capabilities,
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          root_markers = { "go.mod", "go.work" },
        },
        html = {
          capabilities = capabilities,
          cmd = { "vscode-html-language-server", "--stdio" },
          filetypes = { "html" },
          root_markers = { "package.json" },
        },
        lua_ls = {
          capabilities = capabilities,
          cmd = { "lua-language-server" },
          filetypes = { "lua" },
          root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" },
        },
      }
      
      -- Apply configurations using the new API
      for server_name, config in pairs(servers) do
        vim.lsp.config(server_name, config)
      end
      
      -- Only setup solargraph if it's installed
      if vim.fn.executable('solargraph') == 1 then
        vim.lsp.config('solargraph', {
          capabilities = capabilities,
          cmd = { "solargraph", "stdio" },
          filetypes = { "ruby" },
          root_markers = { "Gemfile", ".git" },
        })
      end
      
      -- Enable LSP servers on appropriate filetypes
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'go', 'gomod', 'gowork', 'gotmpl', 'html', 'lua', 'ruby' },
        callback = function(args)
          local servers_to_enable = {}
          
          -- Determine which servers to enable based on filetype
          if vim.tbl_contains({ 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }, args.match) then
            table.insert(servers_to_enable, 'ts_ls')
          elseif vim.tbl_contains({ 'go', 'gomod', 'gowork', 'gotmpl' }, args.match) then
            table.insert(servers_to_enable, 'gopls')
          elseif args.match == 'html' then
            table.insert(servers_to_enable, 'html')
          elseif args.match == 'lua' then
            table.insert(servers_to_enable, 'lua_ls')
          elseif args.match == 'ruby' and vim.fn.executable('solargraph') == 1 then
            table.insert(servers_to_enable, 'solargraph')
          end
          
          -- Enable the servers
          for _, server in ipairs(servers_to_enable) do
            vim.lsp.enable(server)
          end
        end,
      })
      
      -- LSP Keybindings
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
