-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorscheme Picker" })

-- jumplist navigation remap (neovim-qt / GUI 下使用 C-A-Left/Right)
vim.keymap.set("n", "<C-A-Left>", "<C-o>", { desc = "Jump back" })
vim.keymap.set("n", "<C-A-Right>", "<C-i>", { desc = "Jump forward" })

