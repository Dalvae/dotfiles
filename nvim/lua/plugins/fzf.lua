return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    -- Configuración existente
    opts.defaults = opts.defaults or {}

    -- Desactivar abreviación de rutas
    opts.defaults.path_shorten = false

    -- Configurar título de previsualización para mostrar ruta completa
    opts.winopts = opts.winopts or {}
    opts.winopts.preview = opts.winopts.preview or {}
    opts.winopts.preview.title = true
    opts.winopts.preview.title_pos = "center"

    -- Configuración de archivos
    opts.files = opts.files or {}
    opts.files.fd_opts = "--color=never --type f --follow" -- No incluye --hidden por defecto
    opts.files.hidden = false -- No mostrar archivos ocultos por defecto
    opts.files.no_ignore = false -- Respetar .gitignore por defecto

    -- Configuración de grep
    opts.grep = opts.grep or {}
    opts.grep.rg_opts = "--column --line-number --no-heading --color=always --smart-case" -- Sin --hidden
    opts.grep.hidden = false
    opts.grep.no_ignore = false -- Respetar .gitignore por defecto

    return opts
  end,
}
