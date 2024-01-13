-- Prettier configurations
vim.g['prettier#autoformat'] = 1
vim.g['prettier#autoformat_require_pragma'] = 0

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>r', ':Prettier<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>rf', ':PrettierFile<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ra', ':PrettierAsync<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>rs', ':PrettierSync<CR>', {noremap = true, silent = true})

