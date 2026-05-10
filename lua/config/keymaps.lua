-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Ctrl+Alt+Left/Right as jump backward/forward (replaces <C-o> / <C-i>)
vim.keymap.set("n", "<C-A-Left>", "<C-o>", { desc = "Jump backward" })
vim.keymap.set("n", "<C-A-Right>", "<C-i>", { desc = "Jump forward" })
