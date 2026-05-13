-- Fix: Use proper Lua syntax for global variables at the top
vim.g.wakatime_StatusLineEnabled = 0
vim.g.wakatime_StatusLine = ""

return {
  -- 1. Notifications (Noice)
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      opts.presets.lsp_doc_border = true
    end,
  },

  -- 2. Bufferline (Top Bar - GitHub High Contrast)
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        separator_style = "thin",
      },
      highlights = {
        fill = { bg = "#000000" },
        background = { bg = "#000000", fg = "#6e7681" },
        tab_selected = {
          bg = "#000000",
          fg = "#2f81f7",
          bold = true,
        },
        separator = { fg = "#30363d", bg = "#000000" },
      },
    },
  },

  -- 3. Statusline (Bottom Bar - Power Blue Edition)
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local colors = {
        bg = "#0d1117",
        fg = "#f0f6fc",
        blue = "#2f81f7",
        green = "#3fb950",
        orange = "#d76e00",
        black = "#000000",
        grey = "#30363d",
      }

      local my_lualine_theme = {
        normal = {
          a = { bg = colors.blue, fg = colors.black, gui = "bold" },
          b = { bg = colors.grey, fg = colors.blue },
          c = { bg = colors.black, fg = colors.fg },
        },
        insert = {
          a = { bg = colors.green, fg = colors.black, gui = "bold" },
          b = { bg = colors.grey, fg = colors.green },
          c = { bg = colors.black, fg = colors.fg },
        },
        visual = {
          a = { bg = colors.orange, fg = colors.black, gui = "bold" },
          b = { bg = colors.grey, fg = colors.orange },
          c = { bg = colors.black, fg = colors.fg },
        },
        command = {
          a = { bg = colors.fg, fg = colors.black, gui = "bold" },
          b = { bg = colors.grey, fg = colors.fg },
          c = { bg = colors.black, fg = colors.fg },
        },
      }

      return {
        options = {
          theme = my_lualine_theme,
          component_separators = { left = "⏐", right = "⏐" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
          disabled_filetypes = {
            statusline = { "dashboard", "alpha", "snacks_dashboard" },
          },
          refresh = {
            statusline = 1000,
          },
          extensions = {},
        },

        sections = {
          lualine_a = {
            { "mode", text_weight = "bold" },
          },
          lualine_b = {
            "branch",
          },
          lualine_c = {
            {
              "filetype",
              icon_only = true,
              separator = "",
              padding = { left = 1, right = 0 },
            },
            {
              "filename",
              path = 1,
              symbols = {
                modified = " ",
                readonly = " ",
              },
            },
          },
          lualine_x = {
            {
              "diagnostics",
              symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = "󰛩 ",
              },
            },
          },
          lualine_y = {
            "progress", -- Only shows the percentage (66% in image_388301.png)
          },
          lualine_z = {
            "location", -- Only shows line:column (16:1 in image_388301.png)
          },
        },
      }
    end,
  },

  -- 4. Rename UI
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- 5. Logo (Dashboard)
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
████████╗███████╗ ██████╗ █████╗ ██████╗ ███████╗██╗      
╚══██╔══╝██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝██║      
   ██║   █████╗  ██║     ███████║██████╔╝█████╗  ██║      
   ██║   ██╔══╝  ██║     ██╔══██║██╔══██╗██╔══╝  ██║      
   ██║   ███████╗╚██████╗██║  ██║██████╔╝███████╗███████╗
   ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝
    ]],
        },
      },
    },
  },

  -- 6. File Explorer (Neo-tree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        position = "right",
      },
    },
  },

  -- 7. Filename (Incline - GitHub Blue Edition)
  {
    "b0o/incline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        window = {
          padding = 0,
          margin = { horizontal = 2, vertical = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

          if filename == "" then
            filename = "[No Name]"
          end

          local res = {}

          if vim.bo[props.buf].modified then
            table.insert(res, {
              "  ",
              guifg = "#2f81f7",
              guibg = "#0d1117",
            })
          end

          local icon, icon_color = require("nvim-web-devicons").get_icon_color(filename)

          table.insert(res, {
            " ",
            icon,
            " ",
            guifg = icon_color,
            guibg = "#161b22",
          })

          table.insert(res, {
            " " .. filename .. " ",
            guifg = "#2f81f7",
            gui = "bold",
            guibg = "#0d1117",
          })

          res.guibg = "#30363d"

          return res
        end,
      })
    end,
  },
}
