return {
  "eero-lehtinen/oklch-color-picker.nvim",
  event = "VeryLazy", -- Carga el plugin solo cuando sea realmente necesario.
  version = "*", -- Usa la última versión estable.
  keys = {
    -- Define una tecla para abrir el selector de color bajo el cursor.
    -- La tecla <leader>v es una buena opción para "visualizar" o "ver".
    {
      "<leader>pc",
      function()
        require("oklch-color-picker").pick_under_cursor()
      end,
      desc = "Pick color under cursor",
    },
  },
  ---@type oklch.Opts
  opts = {
    -- Aquí puedes personalizar las opciones si lo deseas.
    -- Por ejemplo, para deshabilitar el resaltado automático de colores:
    -- highlight = { enabled = false },

    -- O para cambiar el estilo de resaltado (por defecto es "background"):
    highlight = {
      enabled = true,
      style = "background", -- Puedes probar "foreground", "virtual_left", etc.
      virtual_text = "■ ", -- El carácter que se muestra para colores virtuales.
      -- Puedes añadir más configuraciones de resaltado aquí según tus preferencias.
    },

    -- Si quieres que el plugin reconozca otros formatos o deshabilitar algunos por defecto:
    patterns = {
      -- Puedes deshabilitar un patrón predeterminado:
      -- numbers_in_brackets = false,

      -- O definir tus propios patrones, por ejemplo, para GLSL (como en la documentación del plugin):
      -- glsl_vec_linear = {
      --   priority = 5,
      --   format = "raw_rgb_float",
      --   ft = { "glsl" },
      --   "vec3%(()[%d.,%s]+()%)",
      --   "vec4%(()[%d.,%s]+()%)",
      -- },
    },

    -- Para que el plugin descargue automáticamente la aplicación Rust del selector:
    auto_download = true,

    -- Para usar la versión de Windows de la app en WSL (si es tu caso):
    wsl_use_windows_app = true,

    -- Nivel de log para depuración:
    log_level = vim.log.levels.INFO,
  },
}
