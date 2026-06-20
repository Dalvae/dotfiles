-- Rich side-by-side git diff viewer, driven by the Claude PostToolUse hook
-- (~/.claude/hooks/claude-diff-viewer.sh). Shows working-tree changes incl.
-- untracked files, in nvim, so LSP stays active on the working-tree side.
return {
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewFileHistory",
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        -- imerge-style 2-way diff of the working tree
        default = { layout = "diff2_horizontal" },
      },
    },
  },
}
