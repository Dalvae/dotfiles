return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "eldritch",
    },
  },

  {
    "mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "light",
    },
  },
  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      palette = "lighter",
      transparent = false,
      ---@param colors ColorScheme
      -- on_colors = function(colors)
      --   colors.bg = "#121212" -- Negro menos oscuro
      --   colors.bg_dark = "#121212"
      -- end,
      ---@param highlights Highlights
      ---@param colors ColorScheme
      on_highlights = function(highlights, colors)
        -- Cambiar el color de los comentarios
        highlights.Comment = {
          fg = "#D8E0FF", -- Cambia este color al que prefieras
          italic = true, -- Mantiene los comentarios en cursiva
        }
      end,
    },
  },
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   priority = 1000, -- Ensure it loads first
  -- },
}
