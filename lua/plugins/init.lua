return {
    -- formatting!
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require "configs.conform"
        end,
    },

    -- formatting!
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },


    -- lsp stuff
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        opts = {
            ensure_installed = {
                -- LSP
                "pyright",
                -- Formatters
                "black",
                "isort",
                -- Linter
                "ruff",
            },
        },
    },

    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require("configs.mason-conform")
        end,
    },

    -- UFO (Ultra FOld) to fold code blocks
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        event = "BufRead",
        opts = {},
        config = function()
            -- Fold options
            vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
            vim.o.foldcolumn = "1" -- '0' is not bad
            vim.o.foldlevel = 50 -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 50
            vim.o.foldenable = true
            require("ufo").setup()
        end,
        -- init = function()
        -- -- Using ufo provider need remap zR and zM. If Neovim is 0.6.1, remap yourself
        -- vim.keymap.set("n", "zR", function()
        -- require("ufo").openAllFolds()
        -- end)
        -- vim.keymap.set("n", "zM", function()
        -- require("ufo").closeAllFolds()
        -- end)
        -- end,
    },
	
    -- Markdown Rendering
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        ft = { 'markdown', 'quarto' },
        opts = {},
    },

	-- Git Signs
    {
        "lewis6991/gitsigns.nvim",
		event = "User FilePost",
	    opts = function()
      		return require "nvchad.configs.gitsigns"
    	end,
        config = function()
        require("gitsigns").setup({
            on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map("n", "]c", function()
                if vim.wo.diff then
                return "]c"
                end
                vim.schedule(function()
                gs.next_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })

            map("n", "[c", function()
                if vim.wo.diff then
                return "[c"
                end
                vim.schedule(function()
                gs.prev_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })

            -- Actions
            map("n", "<leader>hs", gs.stage_hunk, { desc = "GitSigns state hunk" })
            map("n", "<leader>hr", gs.reset_hunk, { desc = "GitSigns reset hunk" })
            map("v", "<leader>hs", function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, { desc = "GitSigns stage_hunk" })
            map("v", "<leader>hr", function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, { desc = "GitSigns reset_hunk" })
            map("n", "<leader>hS", gs.stage_buffer, { desc = "GitSigns stage_buffer" })
            map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "GitSigns undo_stage_hunk" })
            map("n", "<leader>hR", gs.reset_buffer, { desc = "GitSigns reset_buffer" })
            map("n", "<leader>hp", gs.preview_hunk, { desc = "GitSigns preview_hunk" })
            map("n", "<leader>hb", function()
                gs.blame_line({ full = true })
            end, { desc = "GitSigns blame line" })
            map("n", "<leader>htb", gs.toggle_current_line_blame, { desc = "GitSigns toggle blame" })
            map("n", "<leader>hd", gs.diffthis, { desc = "GitSigns diffthis" })
            map("n", "<leader>hD", function()
                gs.diffthis("~")
            end, { desc = "GitSigns diffthis" })
            map("n", "<leader>htd", gs.toggle_deleted, { desc = "GitSigns toggle_deleted" })

            -- Text object
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns select hunk" })
            end,
        })
        end,
    },

}
