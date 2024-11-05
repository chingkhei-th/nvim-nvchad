-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- list of all servers configured.
lspconfig.servers = {
	"lua_ls",
	-- "clangd",
	"cssls",
	"html",
	"jsonls",
	"pyright",
}

-- list of servers configured with default config.
local default_servers = {
	"pyright",
	-- "ruff",
}

-- pyright setup
lspconfig.pyright.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	}
end

-- Ruff with pyright LSP settings --
----
-- local on_attach = function(client, bufnr)
--   if client.name == 'ruff' then
--     -- Disable hover in favor of Pyright
--     client.server_capabilities.hoverProvider = false
--   end
-- end

-- lspconfig.ruff.setup({
--     on_attach = on_attach,
--     init_options = {
--     settings = {
--       -- Any extra CLI arguments for `ruff` go here.
--       args = {},
--     }
--   }
-- })

-- -- Pyright settings
-- lspconfig.pyright.setup ({
--   settings = {
--     pyright = {
--       -- Using Ruff's import organizer
--       disableOrganizeImports = true,
--     },
--     python = {
--       analysis = {
--         typeCheckingMode = "off", -- Disable type checking diagnostics
--         -- Ignore all files for analysis to exclusively use Ruff for linting
--         ignore = { '*' },
--       },
--     },
--   },
-- })
----

-- C lang & others setup
-- lspconfig.clangd.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--     on_init = on_init,
--     capabilities = capabilities,
-- })

-- lspconfig.gopls.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--     on_init = on_init,
--     capabilities = capabilities,
--     cmd = { "gopls" },
--     filetypes = { "go", "gomod", "gotmpl", "gowork" },
--     root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
--     settings = {
--         gopls = {
--             analyses = {
--                 unusedparams = true,
--             },
--             completeUnimported = true,
--             usePlaceholders = true,
--             staticcheck = true,
--         },
--     },
-- })

-- lspconfig.hls.setup({
--     on_attach = function(client, bufnr)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         on_attach(client, bufnr)
--     end,
--
--     on_init = on_init,
--     capabilities = capabilities,
-- })

-- lspconfig.lua_ls.setup({
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,

--     settings = {
--         Lua = {
--             diagnostics = {
--                 -- enable = false, -- Disable all diagnostics from lua_ls
--                 globals = { "vim" },
--             },
--             workspace = {
--                 library = {
--                     vim.fn.expand("$VIMRUNTIME/lua"),
--                     vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
--                     vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
--                     vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
--                     "${3rd}/love2d/library",
--                 },
--                 maxPreload = 100000,
--                 preloadFileSize = 10000,
--             },
--         },
--     },
-- })
