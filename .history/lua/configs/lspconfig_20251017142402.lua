-- Load NvChad's default LSP configurations (sets up on_attach, on_init, capabilities)
require("nvchad.configs.lspconfig").defaults()

-- Access the defaults for reuse in custom configs
local defaults = require "nvchad.configs.lspconfig"

local servers = { "html", "cssls", "pyright", "clangd", "marksman" }

-- Python-specific config (pyright) using new API
vim.lsp.config("pyright", {
  on_attach = defaults.on_attach,
  on_init = defaults.on_init,
  capabilities = defaults.capabilities,
  handlers = {
    ["textDocument/signatureHelp"] = function() end,  -- Disable signature help popup
  },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
      },
    },
  },
})

-- C/C++-specific config (clangd) using new API
vim.lsp.config("clangd", {
  on_attach = defaults.on_attach,
  on_init = defaults.on_init,
  capabilities = defaults.capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
})

-- Enable all listed servers (handles defaults for non-custom servers)
vim.lsp.enable(servers)