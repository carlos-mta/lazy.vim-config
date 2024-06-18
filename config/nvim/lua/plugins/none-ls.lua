return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.djhtml,
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        }),
        null_ls.builtins.diagnostics.eslint.with({
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        }),
      },
      on_attach = function(client, bufnr)
        -- Ensure null-ls attaches to buffers with the specified filetypes
        if client.name == "null-ls" then
          client.config.autostart = true
        end
      end,
    })
  end,
}
