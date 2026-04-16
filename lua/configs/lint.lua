local lint = require "lint"

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  vue = { "eslint_d" },
  css = { "stylelint" },
  scss = { "stylelint" },
  less = { "stylelint" },
  python = { "ruff" },
  markdown = { "markdownlint" },
  yaml = { "yamllint" },
}

local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

