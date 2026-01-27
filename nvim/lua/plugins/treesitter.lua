return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- Asegurar que los parsers base de LazyVim estén incluidos
    -- y añadir los parsers que faltan para snacks.image y otros usos
    vim.list_extend(opts.ensure_installed, {
      "css",
      "latex",
      "norg", -- Aunque no es común, estaba en la lista de warnings
      "scss",
      "svelte",
      "typst",
      "vue",
      -- Añade aquí otros parsers que necesites
    })
  end,
}
