-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", ";", ":", { desc = "Ex mode" })
vim.keymap.set("v", ";", ":", { desc = "Ex mode" })

vim.keymap.set("n", "<C-i>", "<cmd>vertical resize -4<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-u>", "<cmd>vertical resize +4<cr>", { desc = "Increase Window Width" })
