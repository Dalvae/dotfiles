-- Keep kitty's background alpha everywhere EXCEPT while nvim is open.
-- (Diego likes the transparency in the shell / Claude Code, but not behind nvim
-- text where it hurts contrast.) nvim flips the *current kitty OS window* opaque
-- on enter and restores the alpha on leave/suspend.
--
-- Requires in kitty.conf:  allow_remote_control yes  +  dynamic_background_opacity yes
-- Only acts inside kitty (guarded by $KITTY_WINDOW_ID); no-op in any other terminal.
local NORMAL = "0.95" -- must match background_opacity in kitty.conf
local OPAQUE = "1.0"

local function set_opacity(value)
  if not vim.env.KITTY_WINDOW_ID then return end
  -- synchronous so it completes before nvim exits on VimLeavePre
  vim.fn.system({ "kitty", "@", "set-background-opacity", value })
end

local grp = vim.api.nvim_create_augroup("KittyOpaqueWhileNvim", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
  group = grp,
  callback = function() set_opacity(OPAQUE) end,
})
vim.api.nvim_create_autocmd({ "VimLeavePre", "VimSuspend" }, {
  group = grp,
  callback = function() set_opacity(NORMAL) end,
})
