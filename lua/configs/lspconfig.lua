-- Load NvChad's default LSP configurations (sets up on_attach, on_init, capabilities)
require("nvchad.configs.lspconfig").defaults()

-- Access the defaults for reuse in custom configs
local defaults = require "nvchad.configs.lspconfig"

-- Disable signature help globally for all LSP servers
vim.lsp.handlers["textDocument/signatureHelp"] = function() end

-- Simple servers that need no extra config
local servers = { "html", "cssls", "pyright", "clangd", "marksman", "sqlls", "cssmodules_ls", "prismals" }

-- Python-specific config (pyright) using new API
vim.lsp.config("pyright", {
  on_attach = defaults.on_attach,
  on_init = defaults.on_init,
  capabilities = defaults.capabilities,
  handlers = {
    ["textDocument/signatureHelp"] = function() end,
  },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
      },
    },
  },
})

-- C/C++-specific config (clangd)
vim.lsp.config("clangd", {
  on_attach = defaults.on_attach,
  on_init = defaults.on_init,
  capabilities = defaults.capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
})

-- TypeScript / JavaScript (ts_ls)
vim.lsp.config("ts_ls", {
  on_attach = defaults.on_attach,
  on_init = defaults.on_init,
  capabilities = defaults.capabilities,
  handlers = {
    ["textDocument/signatureHelp"] = function() end,
  },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
})

-- ESLint LSP
vim.lsp.config("eslint", {
  on_attach = function(client, bufnr)
    defaults.on_attach(client, bufnr)
    -- Auto-fix on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  on_init = defaults.on_init,
  capabilities = defaults.capabilities,
  settings = {
    workingDirectory = { mode = "auto" },
  },
})

-- Vue (Volar) - supports Vue 3 + Nuxt
vim.lsp.config("volar", {
  on_attach = defaults.on_attach,
  on_init = defaults.on_init,
  capabilities = defaults.capabilities,
  filetypes = { "vue" },
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
})

-- Tailwind CSS
vim.lsp.config("tailwindcss", {
  on_attach = defaults.on_attach,
  on_init = defaults.on_init,
  capabilities = defaults.capabilities,
  filetypes = {
    "html",
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
  },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
          { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          { "tw`([^`]*)", "tw`([^`]*)" },
        },
      },
    },
  },
})

-- JSON LSP with SchemaStore (package.json, tsconfig, .eslintrc, etc.)
vim.lsp.config("jsonls", {
  on_attach = defaults.on_attach,
  on_init = defaults.on_init,
  capabilities = defaults.capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

-- YAML LSP with SchemaStore (GitHub Actions, docker-compose, k8s, etc.)
vim.lsp.config("yamlls", {
  on_attach = defaults.on_attach,
  on_init = defaults.on_init,
  capabilities = defaults.capabilities,
  settings = {
    yaml = {
      schemaStore = { enable = false, url = "" },
      schemas = require("schemastore").yaml.schemas(),
      validate = true,
      format = { enable = true },
    },
  },
})

-- Emmet LSP — HTML/CSS abbreviation expansion (div.container>ul>li*3, etc.)
vim.lsp.config("emmet_language_server", {
  on_attach = defaults.on_attach,
  on_init = defaults.on_init,
  capabilities = defaults.capabilities,
  filetypes = {
    "html", "css", "scss", "less",
    "javascript", "javascriptreact",
    "typescript", "typescriptreact",
    "vue",
  },
})

-- Enable simple servers
vim.lsp.enable(servers)
-- Enable feature-rich servers
vim.lsp.enable { "ts_ls", "eslint", "volar", "tailwindcss", "jsonls", "yamlls", "emmet_language_server" }
