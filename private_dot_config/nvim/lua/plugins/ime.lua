return {
  {
    "keaising/im-select.nvim",
    enabled = false,
    event = "InsertEnter",
    opts = {
      default_im_select = "keyboard-us",
      default_command = "im-select",
      set_previous_events = { "InsertEnter" },
    },
  },
}
