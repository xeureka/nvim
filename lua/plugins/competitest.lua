return {
  "xeluxee/competitest.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("competitest").setup({
      local_config_file_name = ".competitest.lua",

      receive_print_message = true,

      compile_command = {
        cpp = {
          exec = "g++",
          args = {
            "-std=c++20",
            "-O2",
            "-Wall",
            "$(FNAME)",
            "-o",
            "$(FNOEXT)",
          },
        },
      },

      run_command = {
        cpp = {
          exec = "./$(FNOEXT)",
        },
      },
    })
  end,
}
