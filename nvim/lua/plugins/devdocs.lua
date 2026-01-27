-- Plugin para buscar documentación con Devdocs
return {
  "luckasRanarison/nvim-devdocs",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim", -- Opcional, pero recomendado para la interfaz
  },
  opts = {
    -- Especificar qué documentaciones instalar por defecto
    ensure_instaled = {
      "python",
      "lua",
      "vim",
      "tailwindcss",
      "astro",
      "php",
      "react",
      "wordpress",
      "java",
      "typescript",
      "javascript",
    },
    -- Mapeos de filetype a documentación específica para DevdocsOpenCurrent
    filetypes = {
      python = "python",
      lua = "lua",
      vim = "vim",
      css = "tailwindcss", -- Abrir docs de Tailwind para archivos CSS
      astro = "astro",
      php = { "php", "wordpress" }, -- Abrir docs de PHP y WordPress para archivos PHP
      javascriptreact = "react", -- Para archivos .jsx
      typescriptreact = "react", -- Para archivos .tsx
      java = "java",
      typescript = "typescript",
      javascript = "javascript",
      -- Puedes añadir más mapeos aquí si es necesario
      -- Ejemplo: scss = "sass",
    },
    -- Opciones pasadas al picker de Telescope para Devdocs
    telescope = {
      -- Desactivar la ventana de previsualización para evitar el error 'to_yaml'
      previewer = false,
    },
    -- Usar glow para previsualizar el contenido Markdown
    -- previewer_cmd = "glow",
    -- Habilitar ajuste de línea en la ventana flotante
    wrap = false,
    -- Puedes añadir otras opciones de configuración aquí si lo necesitas
    -- Consulta la documentación de devdocs.nvim para más detalles
  },
  -- Comandos necesarios para la funcionalidad básica y la instalación
  cmd = { "DevdocsFetch", "DevdocsInstall", "DevdocsUpdate", "DevdocsOpenCurrentFloat" }, -- Añadido DevdocsOpenCurrentFloat para asegurar que esté disponible con carga diferida
  -- Carga diferida para mejorar el tiempo de inicio
  event = "VeryLazy",
  -- Función de configuración para ejecutar comandos después de cargar el plugin
  config = function(_, opts)
    -- Configurar el plugin con las opciones definidas
    require("nvim-devdocs").setup(opts)

    -- Actualizar todas las documentaciones instaladas poco después del inicio
    -- Usamos defer_fn para no bloquear el inicio
    vim.defer_fn(function()
      vim.cmd("DevdocsUpdateAll")
    end, 100) -- Retraso de 100ms (ajustable)
  end,
}
