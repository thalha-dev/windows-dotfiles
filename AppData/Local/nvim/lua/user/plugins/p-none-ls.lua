return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.prettier,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>lF", vim.lsp.buf.format, { desc = "Format with none-ls" })
  end,
}
