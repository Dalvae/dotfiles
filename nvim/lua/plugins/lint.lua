return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      markdown = {}, -- Esto desactiva cualquier linter para markdown
    },
    -- O si prefieres mantener markdownlint pero configurarlo:
    -- linters = {
    --   markdownlint = {
    --     args = { "--config", '{"MD013": false}' },
    --   },
    -- },
  },
}
