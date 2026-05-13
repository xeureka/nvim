return {
  {
    "wakatime/vim-wakatime",
    lazy = false,
    config = function()
      vim.g.wakatime_StatusLineEnabled = 0
      vim.g.wakatime_StatusLine = ""
    end,
  },
}
