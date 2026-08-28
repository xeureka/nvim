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
            "--tab-width=4",
            "--trailing-comma=all",
            "--print-width=80",
          },
        },
      },
    },
  },
}
