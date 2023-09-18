--[[
  File: prettier.lua
  Description: This file needed for loading plugin list into lazy.nvim and loading plugins
  See: https://github.com/prettier/vim-prettier
]]
local prettier = require("prettier")

prettier.setup({
  bin = 'prettierd',
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "css",
    "scss",
    "json",
    "graphql",
    "markdown",
    "vue",
    "html",
    "yaml",
    "svelte",
    "lua",
    "python",
    "php",
    "ruby",
    "go",
    "rust",
    "java",
    "c",
    "cpp",
    "cs",
    "scala",
    "swift",
    "kotlin",
    "dart",
    "elixir",
    "elm",
    "erlang",
    "haskell",
    "julia",
    "nim",
    "ocaml",
    "purescript",
    "reason",
    "ruby",
    "terraform",
    "vim",
    "yaml",
  },
})
