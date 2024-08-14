-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Write files when focus is lost
vim.api.nvim_create_autocmd("FocusLost", {
  callback = function()
    vim.cmd("wa")
  end,
})
