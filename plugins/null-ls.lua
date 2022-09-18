return function(config)
  local null_ls = require "null-ls"
  -- Check supported formatters and linters
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local formatting = null_ls.builtins.formatting

  -- Check supported linters
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions
  local completion = null_ls.builtins.completion

  config.debug = true
  config.sources = { -- Set a formatter
    code_actions.eslint_d,
    diagnostics.eslint_d,
    completion.luasnip,
    formatting.eslint_d,
    formatting.stylua,
    formatting.prettier.with {
      disabled_filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    }, -- Set a linter
  }
  -- set up null-ls's on_attach function
  config.on_attach = function(client)
    -- NOTE: You can remove this on attach function to disable format on save
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Auto format before save",
        pattern = "<buffer>",
        callback = vim.lsp.buf.formatting_sync,
      })
    end
  end
  return config -- return final config table
end
