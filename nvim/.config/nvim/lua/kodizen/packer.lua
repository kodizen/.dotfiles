-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Color scheme
  { import = 'kodizen.plugins.tokyonight' },

  -- Commenting support.
  { import = 'kodizen.plugins.vim-commentary' },

  -- Add, change, and delete surrounding text.
  { 'tpope/vim-surround' },

  -- Useful commands like :Rename and :SudoWrite.
  { 'tpope/vim-eunuch' },

  -- Pairs of handy bracket mappings, like [b and ]b.
  { 'tpope/vim-unimpaired', event = 'VeryLazy' },

  -- Indent autodetection with editorconfig support.
  { 'tpope/vim-sleuth' },

  -- Allow plugins to enable repeating of commands.
  { 'tpope/vim-repeat' },

  -- Navigate seamlessly between Vim windows and Tmux panes.
  { 'christoomey/vim-tmux-navigator' },

  -- Jump to the last location when opening a file.
  { 'farmergreg/vim-lastplace' },

  -- Enable * searching with visually selected text.
  { 'nelstrom/vim-visual-star-search' },

  -- Automatically create parent dirs when saving.
  { 'jessarcher/vim-heritage' },

  -- Automatically set the working directory to the project root.
  { import = 'kodizen.plugins.vim-rooter' },

  -- Automatically add closing brackets, quotes, etc.
  { 'windwp/nvim-autopairs', config = true },
  -- All closing buffers without closing the split window.
  { import = 'kodizen.plugins.bufdelete' },

  -- Split arrays and methods onto multiple lines, or join them back up.
  { import = 'kodizen.plugins.treesj' },

  -- Automatically fix indentation when pasting code.
  { import = 'kodizen.plugins.vim-pasta' },

  -- Fuzzy finder
  { import = 'kodizen.plugins.telescope' },

  -- File tree sidebar
  { import = 'kodizen.plugins.neo-tree' },

  -- A Status line.
  { import = 'kodizen.plugins.lualine' },

  -- Display indentation lines.
  { import = 'kodizen.plugins.indent-blankline' },

  -- Add a dashboard.
  { import = 'kodizen.plugins.dashboard-nvim' },

  -- Git integration.
  { import = 'kodizen.plugins.gitsigns' },

  -- Git commands.
  { 'tpope/vim-fugitive', dependencies = 'tpope/vim-rhubarb' },

  --- Floating terminal.
  { import = 'kodizen.plugins.floaterm' },

  -- Improved syntax highlighting
  { import = 'kodizen.plugins.treesitter' },

  -- Language Server Protocol.
  { import = 'kodizen.plugins.lspconfig' },

  -- Completion
  { import = 'kodizen.plugins.cmp' },

  -- PHP Refactoring Tools
  { import = 'kodizen.plugins.phpactor' },

  -- Project Configuration.
  { import = 'kodizen.plugins.projectionist' },

  -- Testing helper
  { import = 'kodizen.plugins.vim-test' },

  -- GitHub Copilot
  { import = 'kodizen.plugins.copilot' },

  -- Colorize Hex Codes
  { import = 'kodizen.plugins.colorizer' },

  -- Show file and LSP context in a bar at the top of the screen.
  { import = 'kodizen.plugins.barbecue' },

  -- Virtual scrollbar
  { import = 'kodizen.plugins.nvim-scrollbar' },

  -- Highlight occurrences of the word under the cursor.
  { import = 'kodizen.plugins.illuminate' },

  -- Harpoon
  { import = 'kodizen.plugins.harpoon' },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  install = {
    colorscheme = { "tokyonight", "habamax" },
  },
})
