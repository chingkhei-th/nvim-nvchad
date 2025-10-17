return {
  "rcarriga/nvim-notify",
  enabled = false,
  event = "BufReadPre",
  opts = {
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
      vim.wo.wrap = true
    end,
  },
}