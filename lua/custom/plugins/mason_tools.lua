local tools = {
  -- LSP servers
  "clangd",
  "lua-language-server",
  "pyright",
  "typescript-language-server",
  "eslint-lsp",
  "vue-language-server",
  "tailwindcss-language-server",
  "html-lsp",
  "css-lsp",
  "cssmodules-language-server",
  "json-lsp",
  "yaml-language-server",
  "taplo",
  "marksman",
  "emmet-language-server",
  -- Formatters
  "clang-format",
  "stylua",
  "ruff",
  "prettierd",
  "prettier",
  -- Linters
  "eslint_d",
  "stylelint",
  "markdownlint",
  "yamllint",
}

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = tools,
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "VeryLazy",
    opts = {
      ensure_installed = tools,
      auto_update = false,
      run_on_start = true,
      start_delay = 3000,
      debounce_hours = 12,
    },
  },
}
