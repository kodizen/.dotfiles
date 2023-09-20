--[[
  File: conform.lua
  Description: Conform to the standard
]]

local conform = require("conform")

conform.setup({
   formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        -- Use a sub-list to run only the first available formatter
        php = { { "phpcbf", "php-cs-fixer" } },
        html = { "prettierd" },
        css = { "prettierd" },
        scss = { "prettierd" },
        json = { "prettierd" },
        markdown = { "prettierd" },
        yaml = { "prettierd" },
        toml = { "prettierd" },
        rust = { "rustfmt" },
        go = { "gofmt" },
        java = { "google-java-format" },
        cpp = { "clang-format" },
        c = { "clang-format" },
  },
  format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
})
