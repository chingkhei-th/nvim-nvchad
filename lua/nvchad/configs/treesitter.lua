pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

return {
  ensure_installed = { "lua", "luadoc", "markdown", "printf", "python", "toml", "vim", "vimdoc", "yaml", },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

-- require("nvim-treesitter.configs").setup(options)