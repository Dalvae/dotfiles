-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.wrap = true -- Enable line wrap
opt.autoread = true -- Automatically reread files when changed outside of Vim
opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))]]
opt.relativenumber = false
opt.scrolloff = 12 -- Mantener 12 líneas por encima/debajo del cursor al desplazarse
opt.spell = true
opt.spelllang = { "en_us", "es" }

-- Añadir borde a las ventanas flotantes de LSP (incluyendo hover K)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded", -- Puedes usar "single", "double", "shadow", etc.
})

-- Opcional: Añadir borde también a la ventana de signature help (ayuda de firma)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})
