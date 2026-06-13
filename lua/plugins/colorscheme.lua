return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,

        -- Enable transparency
        transparent_mode = true,

        contrast = "hard",

        overrides = {
          -- Main editor
          Normal = { bg = "NONE" },
          NormalNC = { bg = "NONE" },

          -- Floating windows
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },

          -- Sign column / line numbers
          SignColumn = { bg = "NONE" },
          LineNr = { bg = "NONE" },
          CursorLineNr = { fg = "#fe8019", bold = true },

          -- Cursor line
          CursorLine = { bg = "NONE" },

          -- Split separators
          WinSeparator = { fg = "#3c3836", bg = "NONE" },

          -- End of buffer tildes
          EndOfBuffer = { bg = "NONE" },

          -- Fold column
          FoldColumn = { bg = "NONE" },

          -- Popup menu
          Pmenu = { bg = "NONE" },
          PmenuSel = { bold = true },

          -- Statusline
          StatusLine = { bg = "NONE" },
          StatusLineNC = { bg = "NONE" },

          -- Tabline
          TabLine = { bg = "NONE" },
          TabLineFill = { bg = "NONE" },

          -- Telescope
          TelescopeNormal = { bg = "NONE" },
          TelescopeBorder = { bg = "NONE" },
          TelescopePromptNormal = { bg = "NONE" },
          TelescopeResultsNormal = { bg = "NONE" },
          TelescopePreviewNormal = { bg = "NONE" },

          -- Neo-tree
          NeoTreeNormal = { bg = "NONE" },
          NeoTreeNormalNC = { bg = "NONE" },

          -- Lazy
          LazyNormal = { bg = "NONE" },

          -- Mason
          MasonNormal = { bg = "NONE" },

          -- WhichKey
          WhichKeyFloat = { bg = "NONE" },

          -- Indent Blankline
          IblScope = { fg = "#fe8019" },
          IblIndent = { fg = "#282828" },
        },
      })

      vim.cmd.colorscheme("gruvbox")
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
