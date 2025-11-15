-- Plugin for discord rich presence
return
{
  'vyfor/cord.nvim',
  build = ':Cord update',
  event = 'BufReadPre', -- or 'BufReadPre' to load on file open or 'VeryLazy' to laod after startup
  opts = {
    display = {
        theme = 'atom',
        flavor = 'dark',
    },
    idle = {
        enable = 'true',
      },
  },
}
