-- :ClaudeShow {file} — open the file Claude just wrote, show diff inline.
-- Simple: no tabs, no splits, no grouping. Just open in current window.
-- If the file is already open, jump to it and reload.
-- mini.diff signs show what changed (green = added, red = removed).

vim.api.nvim_create_user_command("ClaudeShow", function(opts)
  local file = vim.fn.fnamemodify(opts.args, ":p")
  if file == "" or vim.fn.filereadable(file) == 0 then return end

  -- Find if the file is already open in any window
  local target = vim.fn.fnamemodify(file, ":p")
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_buf_get_name(buf) == target then
      vim.api.nvim_set_current_win(win)
      vim.cmd("silent! checktime")
      vim.cmd("normal! G$")
      return
    end
  end

  -- Not open yet — open in current window
  vim.cmd("edit " .. vim.fn.fnameescape(file))
  vim.cmd("silent! checktime")
end, { nargs = 1, complete = "file" })