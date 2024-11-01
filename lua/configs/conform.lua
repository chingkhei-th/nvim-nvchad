local conform = require "conform"

conform.setup {
  formatters_by_ft = {
    python = { "black" },
  },
  formatters = {
    -- isort = {
    --   prepend_args = { "--profile", "black" },
    -- },
    black = {
      prepend_args = { "--quiet" },
    },
  },
  -- Format on save
  format_on_save = {
    -- I recommend these options. See :help conform.format for details
    lsp_fallback = true,
    timeout_ms = 500,
  },
}

-- Optional: Set up format-on-save with a key binding
vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  conform.format {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  }
end, { desc = "Format file or range (in visual mode)" })

-- others formatter
local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        -- c = { "clang-format" },
        css = { "prettier" },
        html = { "prettier" },
        -- cpp = { "clang-format" },
        -- go = { "gofumpt", "goimports-reviser", "golines" },
        -- haskell = { "fourmolu", "stylish-haskell" },
        json = { "prettier"},
        javascript = { "prettier", stop_after_first = true },
        -- python = { "black", "isort" },
    },

    formatters = {
        -- -- C & C++
        -- ["clang-format"] = {
        --     prepend_args = {
        --         "-style={ \
        --                 IndentWidth: 4, \
        --                 TabWidth: 4, \
        --                 UseTab: Never, \
        --                 AccessModifierOffset: 0, \
        --                 IndentAccessModifiers: true, \
        --                 PackConstructorInitializers: Never}",
        --     },
        -- },
        -- -- Golang
        -- ["goimports-reviser"] = {
        --     prepend_args = { "-rm-unused" },
        -- },
        -- golines = {
        --     prepend_args = { "--max-len=80" },
        -- },
        -- Lua
        stylua = {
            prepend_args = {
                "--column-width", "88",
                "--line-endings", "Unix",
                "--indent-type", "Tabs",
                "--indent-width", "4",
                "--quote-style", "AutoPreferDouble",
            },
        },
    },

    format_on_save = {
        timeout_ms = 1000,  -- Increased timeout
        lsp_fallback = true,
        async = false,      -- Set to false to prevent race conditions
    },
}

require("conform").setup(options)

