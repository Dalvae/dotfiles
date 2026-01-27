return {
  {
    "folke/noice.nvim",
    opts = {
      views = {
        hover = {
          border = {
            style = "double",
          },
          position = { row = 2, col = 2 },
          size = {
            max_width = 80,
            max_height = 20,
          },
          win_options = {
            wrap = true,
            linebreak = true,
          },
        },
      },
      lsp = {
        hover = {
          enabled = true,
          silent = true, -- no muestra mensaje si hover no está disponible
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true, -- automáticamente abre signature help al escribir
            luasnip = true,
            throttle = 50,
          },
        },
        -- Mejora los mensajes de diagnóstico
        message = {
          enabled = true,
          view = "notify",
          opts = {},
        },
      },
      presets = {
        lsp_doc_border = true, -- añade borde a hover docs y signature help
        inc_rename = true, -- habilita renombrado inline
        long_message_to_split = true, -- mensajes largos van a split
        command_palette = true, -- paleta de comandos estilo VSCode
        bottom_search = true, -- búsqueda en la parte inferior
      },
    },
  },
}
