return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "ruff_fix", "black" },
            -- Use a sub-list to run only the first available formatter
            javascript = { "prettier" },
        },

        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 1000,
            lsp_fallback = true,
        },
    },
}
