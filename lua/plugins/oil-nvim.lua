-- A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer.
return {
  -- https://github.com/stevearc/oil.nvim
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}