require "helpers/globals"
require "helpers/keyboard"

g.mapleader = ' '                                                                 -- Use Space, like key for alternative hotkeys

-- LSP {{{
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>' )                                      -- Hover object
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')                                -- Code actions
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')                                     -- Rename an object
nm('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')                                -- Go to declaration
 -- }}}

-- Telescope {{{
nm('gd', '<cmd>Telescope lsp_definitions<CR>')                            -- Goto declaration
nm('<leader>p', '<cmd>Telescope oldfiles<CR>')                                   -- Show recent files
nm('<leader>O', '<cmd>Telescope git_files<CR>')                                  -- Search for a file in project
nm('<leader>o', '<cmd>Telescope find_files<CR>')                                 -- Search for a file (ignoring git-ignore)
nm('<leader>i', '<cmd>Telescope jumplist<CR>')                                   -- Show jumplist (previous locations)
nm('<leader>b', '<cmd>Telescope git_branches<CR>')                               -- Show git branches
nm('<leader>f', '<cmd>Telescope live_grep<CR>')                                  -- Find a string in project
nm('<leader>q', '<cmd>Telescope buffers<CR>')                                    -- Show all buffers
nm('<leader>a', '<cmd>Telescope<CR>')                                            -- Show all commands
nm('<leader>t', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')              -- Search for dynamic symbols
-- }}}

-- Trouble {{{
nm('<leader>x', '<cmd>TroubleToggle<CR>')                                         -- Show all problems in project (with help of LSP)
nm('gr', '<cmd>Trouble lsp_references<CR>')                                       -- Show use of object in project
-- }}}

-- Neo Tree {{{
nm('<leader>v', '<cmd>NeoTreeFocusToggle<CR>')                                        -- Toggle file explorer
nm('<leader>V', '<cmd>NeoTreeToggle<CR>')                                        -- Toggle file explorer



-- }}}

-- General {{{
nm('<leader>q', '<cmd>q<CR>')                                                    -- Quit
nm('<leader>Q', '<cmd>qa<CR>')                                                   -- Quit all
nm('<leader>w', '<cmd>w<CR>')                                                    -- Save
nm('<leader>W', '<cmd>wa<CR>')                                                   -- Save all
nm('<leader>z', '<cmd>nohlsearch<CR>')                                           -- Clear search highlight
nm('<leader>h', '<cmd>nohlsearch<CR>')                                           -- Clear search highlight
nm('<leader>l', '<cmd>set list!<CR>')                                            -- Toggle list mode
nm('<leader><tab>', '<cmd>wincmd w<CR>')                                          -- Switch to next window

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua foldmethod=marker foldlevelstart=0 foldlevel=0


-- Prettier {{{
nm('<leader>pp', '<cmd>Prettier<CR>')                                            -- Format file
nm('<leader>pa', '<cmd>PrettierAsync<CR>')                                       -- Format file async
nm('<leader>ps', '<cmd>PrettierSync<CR>')                                        -- Format file sync
nm('<leader>pc', '<cmd>PrettierConfig<CR>')                                      -- Create prettier config file
nm('<leader>pd', '<cmd>PrettierDebug<CR>')                                       -- Debug prettier

-- }}}
