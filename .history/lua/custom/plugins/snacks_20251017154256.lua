return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = true,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		-- bigfile = { enabled = true },
		-- dashboard = { enabled = true },
		indent = { enabled = true },
		-- input = { enabled = true },
		notifier = { enabled = true, style = "fancy", timeout = 3000 }, -- styles ["compact", "fancy", "minimal"]
		-- quickfile = { enabled = true },
		-- scroll = { enabled = true },
		statuscolumn = { enabled = true },
		-- words = { enabled = true },
		animate = { enabled = true },
	},

	-- Notifier --
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		---@type snacks.Config
		opts = {
			notifier = {
				-- your notifier configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
			lsp = {
      			signature = {
        			enabled = false,
				},
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			-- "MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
}
