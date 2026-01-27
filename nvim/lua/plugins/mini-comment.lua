-- Override default mini.comment settings to use ts-context-commentstring
return {
  "echasnovski/mini.comment",
  event = "VeryLazy",
  dependencies = {
    -- Ensure ts-context-commentstring is loaded, although it's usually included by default
    { "JoosepAlviste/nvim-ts-context-commentstring", opts = {} },
  },
  opts = {
    -- Configuration options
    options = {
      -- Use ts-context-commentstring integration
      custom_commentstring = function()
        -- Try to get comment string from context
        local tscs = require("ts_context_commentstring.internal")
        local commentstring = tscs.calculate_commentstring()

        -- If context commentstring calculation fails, fallback to filetype commentstring
        return commentstring or vim.bo.commentstring
      end,
    },
  },
}
