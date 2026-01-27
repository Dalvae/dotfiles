return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    return {
      sections = {
        lualine_c = {
          {
            "filename",
            path = 1, -- 0: Just filename, 1: Relative path, 2: Absolute path, 3: Absolute path with ~
            file_status = true,
            shorting_target = 40,
            color = "Function", -- Usa el color del grupo de resaltado 'Function'
          },
        },
        -- otras secciones...
      },
    }
  end,
}
