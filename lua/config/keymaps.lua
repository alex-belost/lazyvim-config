-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local Util = require("lazyvim.util")

vim.keymap.del("n", "<leader>l")

vim.keymap.set(
  "n",
  "<leader>be",
  "<cmd>Neotree focus filesystem left reveal<cr>",
  { silent = true, desc = "Open current file" }
)
