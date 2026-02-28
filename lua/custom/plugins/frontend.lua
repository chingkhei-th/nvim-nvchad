-- Frontend development plugins
-- Covers: HTML, CSS, JS, TS, React, Vue, Next.js, Node.js, PostgreSQL, Prisma

return {

  -- ─────────────────────────────────────────────────────────────────────────
  -- Auto-close & auto-rename HTML/JSX/Vue/Svelte tags
  -- e.g. type <div> → auto-inserts </div>, rename opening tag → renames closing
  -- ─────────────────────────────────────────────────────────────────────────
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
        per_filetype = {
          ["html"] = { enable_close = true },
        },
      }
    end,
  },

  -- ─────────────────────────────────────────────────────────────────────────
  -- JSON & YAML schema validation (package.json, tsconfig.json, .eslintrc, etc.)
  -- Integrates with jsonls and yamlls LSP servers automatically
  -- ─────────────────────────────────────────────────────────────────────────
  {
    "b0o/SchemaStore.nvim",
    lazy = true, -- loaded on demand by lspconfig
  },

  -- ─────────────────────────────────────────────────────────────────────────
  -- Show npm package versions inline in package.json
  -- <leader>ns → show package info, <leader>nu → update package
  -- ─────────────────────────────────────────────────────────────────────────
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = "json",
    config = function()
      require("package-info").setup {
        colors = {
          up_to_date = "#3C4048",
          outdated = "#fc514e",
        },
        icons = {
          enable = true,
          style = {
            up_to_date = "|  ",
            outdated = "|  ",
          },
        },
        autostart = true,
        hide_unstable_versions = false,
        package_manager = "npm",
      }

      -- Keymaps (only active in package.json)
      local map = vim.keymap.set
      map("n", "<leader>ns", require("package-info").show, { desc = "npm: show package info", silent = true })
      map("n", "<leader>nh", require("package-info").hide, { desc = "npm: hide package info", silent = true })
      map("n", "<leader>nu", require("package-info").update, { desc = "npm: update package", silent = true })
      map("n", "<leader>nd", require("package-info").delete, { desc = "npm: delete package", silent = true })
      map("n", "<leader>ni", require("package-info").install, { desc = "npm: install new package", silent = true })
      map("n", "<leader>np", require("package-info").change_version, { desc = "npm: change version", silent = true })
    end,
  },

  -- ─────────────────────────────────────────────────────────────────────────
  -- Inline color previews for CSS hex, rgb, hsl, Tailwind classes, etc.
  -- ─────────────────────────────────────────────────────────────────────────
  {
    "brenoprata10/nvim-highlight-colors",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-highlight-colors").setup {
        render = "background", -- 'background' | 'foreground' | 'virtual'
        enable_named_colors = true,
        enable_tailwind = true,  -- highlight Tailwind color classes
      }
    end,
  },

  -- ─────────────────────────────────────────────────────────────────────────
  -- Database client inside Neovim (PostgreSQL, MySQL, SQLite, etc.)
  -- :DBUI to open the UI, connect to your DB, run queries, browse tables
  -- ─────────────────────────────────────────────────────────────────────────
  {
    "tpope/vim-dadbod",
    lazy = true,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion",
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    config = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_force_echo_notifications = 1
      vim.g.db_ui_win_position = "left"
      vim.g.db_ui_winwidth = 40

      -- Auto-complete in SQL buffers opened by DBUI
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          require("cmp").setup.buffer {
            sources = {
              { name = "vim-dadbod-completion" },
              { name = "buffer" },
            },
          }
        end,
      })
    end,
    keys = {
      { "<leader>db", "<cmd>DBUIToggle<CR>", desc = "DB: toggle UI" },
      { "<leader>da", "<cmd>DBUIAddConnection<CR>", desc = "DB: add connection" },
      { "<leader>df", "<cmd>DBUIFindBuffer<CR>", desc = "DB: find buffer" },
    },
  },

  -- ─────────────────────────────────────────────────────────────────────────
  -- Prisma syntax + formatting (LSP already handles this via prismals,
  -- but this gives better syntax highlighting fallback)
  -- ─────────────────────────────────────────────────────────────────────────
  {
    "prisma/vim-prisma",
    ft = "prisma",
  },

  -- ─────────────────────────────────────────────────────────────────────────
  -- Better TypeScript utilities (go-to source definition, rename file, etc.)
  -- Extends ts_ls with actions that ts_ls doesn't expose natively
  -- ─────────────────────────────────────────────────────────────────────────
  {
    "dmmulroy/ts-error-translator.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    config = function()
      require("ts-error-translator").setup {
        auto_attach = true, -- makes TS errors human-readable
      }
    end,
  },

  -- NOTE: tailwind-sorter.nvim is disabled due to Treesitter compatibility issues
  -- with newer Neovim versions. Use prettier-plugin-tailwindcss instead:
  -- npm install -D prettier-plugin-tailwindcss
  -- Then add { "plugins": ["prettier-plugin-tailwindcss"] } to your prettier config.
  -- Prettier (via conform) already runs on save and will sort classes automatically.

}
