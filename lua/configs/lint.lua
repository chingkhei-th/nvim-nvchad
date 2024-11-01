local lint = require("lint")

lint.linters_by_ft = {
    python = { "ruff" },
}

-- Create a new autogroup for linting
local lint_group = vim.api.nvim_create_augroup("CustomLint", { clear = true })

-- Setup autocommand for running linter after format
vim.api.nvim_create_autocmd("BufWritePost", {
  group = lint_group,
  pattern = "*.py",
  callback = function()
    -- Add a larger delay for linting after formatting
    vim.defer_fn(function()
      if vim.api.nvim_buf_is_valid(vim.api.nvim_get_current_buf()) then
        require("lint").try_lint()
      end
    end, 200)
  end,
})

lint.linters.luacheck.args = {
    "--globals",
    "love",
    "vim",
    "--formatter",
    "plain",
    "--codes",
    "--ranges",
    "-",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})
