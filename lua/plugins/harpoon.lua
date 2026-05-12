return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      local harpoon = require("harpoon")

      harpoon:setup({
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = true,
        },
      })

      -- add current file
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end, { desc = "Add file to Harpoon" })

      -- toggle harpoon menu
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Open Harpoon menu" })

      -- jump to files
      vim.keymap.set("n", "<C-h>", function()
        harpoon:list():select(1)
      end)

      vim.keymap.set("n", "<C-t>", function()
        harpoon:list():select(2)
      end)

      vim.keymap.set("n", "<C-n>", function()
        harpoon:list():select(3)
      end)

      vim.keymap.set("n", "<C-s>", function()
        harpoon:list():select(4)
      end)

      -- next / previous
      vim.keymap.set("n", "<C-S-P>", function()
        harpoon:list():prev()
      end)

      vim.keymap.set("n", "<C-S-N>", function()
        harpoon:list():next()
      end)
    end,
  },
}
