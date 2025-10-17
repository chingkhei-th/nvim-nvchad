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
		notifier = {
			enabled = true,
			style = "minimal", -- Using minimal style for less intrusive notifications
			timeout = 3000,
			size = {
				max_height = 10, -- Limit maximum height
				max_width = 40   -- Limit maximum width
			},
			position = "top-right" -- Position notifications to avoid code coverage
		},
		-- quickfile = { enabled = true },
		-- scroll = { enabled = true },
		statuscolumn = { enabled = true },
		-- words = { enabled = true },
		animate = { enabled = true },
		lsp = {
			signature = {
				auto_open = {
					enabled = true,
					trigger = false, -- This ensures signatures are shown
					luasnip = true,
				},
				opts = {
					max_height = 5,    -- Limit the height of signature box
					max_width = 40,    -- Limit the width of signature box
					border = "single", -- Use a simple border
					relative = "cursor",
					wrap = true,       -- Wrap long signatures
				},
			},
		},
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
