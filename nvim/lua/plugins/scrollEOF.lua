return {
  "Aasim-A/scrollEOF.nvim",
  event = "InsertEnter", -- Solo cargar cuando entres en insert mode
  opts = {
    insert_mode = true,
    -- Deshabilitar en modo normal y visual
    disabled_modes = { "n", "v", "V", "t", "\22" },
  },
}
