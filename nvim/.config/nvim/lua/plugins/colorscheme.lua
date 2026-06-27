return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "frappe",
      transparent_background = false,
      integrations = {
        blink_cmp = true,
        bufferline = true,
        flash = true,
        gitsigns = true,
        noice = true,
        notify = true,
        snacks = true,
        treesitter = true,
        trouble = true,
        which_key = true,
        mason = true,
        lsp_trouble = true,
        mini = { enabled = true },
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
    },
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      theme = "lotus",
    },
  },
  {
    "sainnhe/everforest",
    lazy = true,
    priority = 1000,
    init = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_better_performance = 1
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      variant = "default",
      italic_comments = true,
      terminal_colors = true,
    },
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      style = "dark",
    },
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
    priority = 1000,
    opts = {},
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin" } },
}
