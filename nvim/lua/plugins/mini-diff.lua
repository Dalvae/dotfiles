-- mini.diff: inline diff signs in the signcolumn
-- Shows added/changed/removed lines with colored signs, no splits needed.
return {
  {
    "echasnovski/mini.diff",
    event = "VeryLazy",
    opts = {
      view = {
        style = "sign",
        signs = {
          add = "▎",
          change = "▎",
          delete = "",
        },
      },
      mappings = {
        goto = "]h",
        goto_prev = "[h",
      },
    },
  },
}