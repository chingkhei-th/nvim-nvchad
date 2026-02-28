return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        -- Core
        "vim", "lua", "vimdoc", "regex", "bash", "comment",
        -- Web / Frontend
        "html", "css", "scss",
        "javascript", "typescript", "tsx",
        "vue", "graphql", "jsdoc",
        -- Config / Data
        "json", "json5", "jsonc", "yaml", "toml",
        "markdown", "markdown_inline",
        -- DB & Prisma
        "sql", "prisma",
        -- Other langs
        "python", "c",
      },
    },
  },

  -- Mini.nvim collection
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.files").setup {
        windows = {
          preview = true,
          width_focus = 30,
          width_preview = 30,
        },
        mappings = {
          close = "q",
          go_in = "l",
          go_in_plus = "<CR>",
          go_out = "h",
          go_out_plus = "H",
          reset = "<BS>",
          reveal_cwd = "@",
          show_help = "g?",
          synchronize = "=",
          trim_left = "<",
          trim_right = ">",
        },
      }
      require("mini.ai").setup { n_lines = 500 }
    end,
  },

  -- Better diagnostics
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    config = function()
      require("tiny-inline-diagnostic").setup()
    end,
  },
}
