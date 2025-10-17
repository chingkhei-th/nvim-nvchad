-- Ensure you have required the necessary modules
local lspconfig = require("lspconfig")
local nvchad_lsp = require("nvchad.configs.lspconfig")

-- Define the list of servers
local servers = { "html", "cssls", "pyright", "clangd", "marksman" }

-- Define the base configuration template
local base_config = {
	on_attach = nvchad_lsp.on_attach,
	on_init = nvchad_lsp.on_init,
	capabilities = nvchad_lsp.capabilities,
}

-- Create the servers table for vim.lsp.config
local server_configs = {}

-- 1. Setup servers with the default NvChad config
for _, lsp in ipairs(servers) do
	-- Deep copy the base config to avoid modifying it
	server_configs[lsp] = vim.deepcopy(base_config)
end

-- 2. Python specific config (pyright)
-- Add pyright-specific settings, overriding the base config
server_configs.pyright.settings = {
	python = {
		analysis = {
			typeCheckingMode = "basic",
		},
	},
}

-- 3. C/C++ specific config (clangd)
-- Add clangd-specific settings, overriding the base config
server_configs.clangd.cmd = {
	"clangd",
	"--offset-encoding=utf-16",
}

-- Apply the configuration using the new vim.lsp.config structure
-- lspconfig.setup() will now use this table to configure servers
lspconfig.setup(server_configs)

-- The original configuration had:
-- require("nvchad.configs.lspconfig").defaults()
-- vim.lsp.config()
-- This is now simplified as lspconfig.setup(server_configs)