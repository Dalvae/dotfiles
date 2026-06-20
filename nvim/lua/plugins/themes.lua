-- A buffet of colorschemes to swap live with the LazyVim picker (<leader>uC).
-- Each gives several variants, so you can audition diff/readability and keep one.
-- lazy=false so they're all available to the picker's live preview.
return {
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 }, -- latte/frappe/macchiato/mocha
  { "rebelot/kanagawa.nvim", lazy = false },          -- wave/dragon/lotus
  { "rose-pine/neovim", name = "rose-pine", lazy = false }, -- main/moon/dawn
  { "EdenEast/nightfox.nvim", lazy = false },          -- nightfox/duskfox/nordfox/carbonfox/terafox
  { "ellisonleao/gruvbox.nvim", lazy = false },        -- high-contrast classic
  { "neanias/everforest-nvim", name = "everforest", lazy = false }, -- soft green, low-fatigue
}
