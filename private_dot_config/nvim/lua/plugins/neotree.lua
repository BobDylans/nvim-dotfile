return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      group_empty_dirs = true,
      use_libuv_file_watcher = true,
      window = {
        mappings = {
          ["p"] = { "toggle_preview", config = { use_float = false } },
        },
      },
    },
  },
}
