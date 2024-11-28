return {
    -- More linters...
    "mfussenegger/nvim-lint",
    config = function ()
        require("lint").linters_by_ft = {
            dockerfile = { "hadolint" },
            markdown = { "proselint" },
            -- python = { "pylint" },
            sh = { "shellcheck" },
        }
        vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWritePost" }, {
            callback = function ()
                require("lint").try_lint()
            end,
        })
    end,
}
