-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local Util = require("lazyvim.util")

-- Abrir documentación flotante con Devdocs para el filetype actual
map({ "n", "v" }, "<leader>D", "<cmd>DevdocsOpen<cr>", { desc = "Abrir Devdocs (Float)" })
