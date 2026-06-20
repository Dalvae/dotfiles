-- codediff.nvim — VSCode-style diff with LSP semantic tokens + tree-sitter
-- :CodeDiff          → explorer con archivos cambiados
-- :CodeDiff file HEAD~1 → diff del archivo vs commit anterior
-- :CodeDiff history  → historial de commits
return {
  {
    "esmuellert/codediff.nvim",
    cmd = { "CodeDiff" },
    opts = {
      highlights = {
        line_insert = "DiffAdd",
        line_delete = "DiffDelete",
        char_brightness = 1.4, -- dark theme: 40% brighter chars
      },
      diff = {
        layout = "side-by-side",
        jump_to_first_change = true,
        compute_moves = true, -- detect moved code blocks
      },
      explorer = {
        position = "left",
        width = 35,
        auto_refresh = true,
      },
      keymaps = {
        view = {
          quit = "q",
          next_hunk = "]c",
          prev_hunk = "[c",
          next_file = "]f",
          prev_file = "[f",
          toggle_layout = "t",
          toggle_explorer = "<leader>b",
          diff_get = "do",
          diff_put = "dp",
        },
      },
    },
  },
}