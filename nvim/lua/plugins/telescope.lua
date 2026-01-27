return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    -- Mantener la configuración existente
    opts.defaults = opts.defaults or {}

    -- Cambiar cómo se muestran las rutas (para no abreviar)
    opts.defaults.path_display = "smart" -- Muestra rutas absolutas completas
    -- Alternativas: "truncate", "smart", o una función personalizada

    -- Para incluir el título con la ruta completa en el preview
    opts.defaults.preview = {
      -- Mostrar título en la ventana de previsualización
      title = true,
    }

    return opts
  end,
}
