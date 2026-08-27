return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
      },
      formatters = {
        prettier = {
          prepend_args = {
            "--semi",
            "--single-quote=false",
            "--tab-width=2",
            "--trailing-comma=all",
            "--print-width=80",
          },
        },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
    },
  },
}
