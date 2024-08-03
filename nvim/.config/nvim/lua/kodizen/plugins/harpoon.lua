return {
'ThePrimeagen/harpoon',
  requires = { 'nvim-lua/plenary.nvim' },  -- Harpoon depends on plenary.nvim
  config = function()
    require("harpoon").setup()
    -- Setting key mappings for Harpoon
    vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end)
    vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end)
    vim.keymap.set("n", "<A-h>", function() require("harpoon.ui").nav_file(1) end)
    vim.keymap.set("n", "<A-j>", function() require("harpoon.ui").nav_file(2) end)
    vim.keymap.set("n", "<A-k>", function() require("harpoon.ui").nav_file(3) end)
    vim.keymap.set("n", "<C-l>", function() require("harpoon.ui").nav_file(4) end)

    -- Toggle previous & next markers within Harpoon list
    vim.keymap.set("n", "<M-j>", function() require("harpoon.ui").nav_prev() end)
    vim.keymap.set("n", "<M-k>", function() require("harpoon.ui").nav_next() end)
end,
}
