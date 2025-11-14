return {
  "kdheepak/lazygit.nvim",
  cmd={
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- Optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first 00:12
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazygit"},
  },
}
