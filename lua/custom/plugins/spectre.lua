-- Plugin to Find and Replace words

return {
  "nvim-pack/nvim-spectre",
  event = "BufReadPre",
  config = function()
    require("spectre").setup()

    -- VS Code-like keymaps for Spectre
    -- In VS Code, Ctrl+F is for Find, and Ctrl+H is for Replace.
    -- In Spectre, both are handled by the same interface.
    -- We use Ctrl+F for find/replace in the current file, as
    -- Ctrl+H is already mapped in your config for window navigation.

    -- Find/Replace in current file
    vim.keymap.set("n", "<C-f>", '<cmd>lua require("spectre").open_file_search()<CR>', { desc = "Find/Replace in file" })

    -- Find/Replace with visual selection
    vim.keymap.set("v", "<C-f>", '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Find/Replace selection" })

    -- Project-wide Find/Replace (VS Code: Ctrl+Shift+H)
    -- Using <leader>sf as Ctrl+Shift+F can be problematic in terminals.
    vim.keymap.set("n", "<leader>sf", '<cmd>lua require("spectre").open()<CR>', { desc = "Project-wide Find/Replace" })

    -- Search for word under cursor
    vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { desc = "Search current word" })
  end,
}
