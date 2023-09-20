--[[
  File: init.lua
  Description: Entry point file for neovim
]]

-- Bootsraping plugin manager
require "lazy-bootstrap"

-- Settings
require "settings"
require "keybindings"

-- Plugin management {{{
local lazy = require("lazy")
lazy.setup("plugins")
-- }}}

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

-- Define a function to perform the global replacement
function global_replace(old, new)
  vim.cmd('args **/*')
  vim.cmd('argdo %s/' .. old .. '/' .. new .. '/gc')
  vim.cmd('wa')
end

-- Map the function to a key sequence, e.g., <Leader>gr
vim.api.nvim_set_keymap('n', '<Leader>gr', [[<Cmd>lua global_replace('CurrentTokenContext', 'CSRFTokenContext')<CR>]],
  { noremap = true, silent = true })

-- Dynamic version
function dynamic_global_replace()
  local old = vim.fn.input('Enter the string to find: ')
  local new = vim.fn.input('Enter the string to replace with: ')
  global_replace(old, new)
end

-- Map the dynamic function to a key sequence, e.g., <Leader>gd
vim.api.nvim_set_keymap('n', '<Leader>gd', [[<Cmd>lua dynamic_global_replace()<CR>]], { noremap = true, silent = true })



-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0
