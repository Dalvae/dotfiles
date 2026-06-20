-- In-buffer markdown rendering for the Claude diff/view hook (nvim is king).
-- markview.nvim renders markdown inline (no server, no browser). We disable
-- LazyVim's default render-markdown.nvim so the two renderers don't clash.
return {
  -- Avoid double-rendering / conflicts: only ONE inline markdown renderer.
  { "MeanderingProgrammer/render-markdown.nvim", enabled = false },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      -- Renderizado limpio, sin decoraciones que corten líneas
      render_modes = { "n", "c", "t" },
      hybrid_modes = { "n" },
      buf_ignore = { "diff" },
      headings = {
        shift_width = 0,
        sign = false,
      },
      list_items = {
        shift_width = 0,
      },
      block_quotes = {
        shift_width = 0,
      },
      code_blocks = {
        style = "simple",
        pad_amount = 0,
      },
      tables = {
        pad_amount = 0,
      },
    },
  },
}