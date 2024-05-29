-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Define an autocmd group for the blade workaround
local augroup = vim.api.nvim_create_augroup("lsp_blade_workaround", { clear = true })

-- Autocommand to temporarily change 'blade' filetype to 'php' when opening for LSP server activation
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup,
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "php"
  end,
})

-- Additional autocommand to switch back to 'blade' after LSP has attached
-- vim.api.nvim_create_autocmd("LspAttach", {
--   pattern = "*.blade.php",
--   callback = function(args)
--     vim.schedule(function()
--       -- Check if the attached client is 'intelephense'
--       for _, client in ipairs(vim.lsp.get_active_clients()) do
--         if client.name == "intelephense" and client.attached_buffers[args.buf] then
--           vim.api.nvim_buf_set_option(args.buf, "filetype", "blade")
--           -- update treesitter parser to blade
--           vim.api.nvim_buf_set_option(args.buf, "syntax", "blade")
--           break
--         end
--       end
--     end)
--   end,
-- })

-- local M = {}
-- -- function to create a list of commands and convert them to autocommands
-- -------- This function is taken from https://github.com/norcalli/nvim_utils
-- function M.nvim_create_augroups(definitions)
--   for group_name, definition in pairs(definitions) do
--     vim.api.nvim_command("augroup " .. group_name)
--     vim.api.nvim_command("autocmd!")
--     for _, def in ipairs(definition) do
--       local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
--       vim.api.nvim_command(command)
--     end
--     vim.api.nvim_command("augroup END")
--   end
-- end
--
-- local autoCommands = {
--   -- other autocommands
--   open_folds = {
--     { "BufReadPost,FileReadPost", "*", "normal zR" },
--   },
-- }
--
-- M.nvim_create_augroups(autoCommands)
