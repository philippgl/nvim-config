vim.api.nvim_create_user_command("FormatDisable", function (args)
    if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
end, {
    desc = "Disable autoformat-on-save",
    bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function ()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
end, {
    desc = "Re-enable autoformat-on-save",
})

local format_on_save = function (bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
    end
    return { timeout_ms = 500, lsp_format = "fallback" }
end

return {
    "stevearc/conform.nvim",
    opts = {
        formatters = {
            cmakelangformat = {
                command = "cmake-format",
                -- if the formatter does not use stdin/out, it is assumed, that
                -- it replaces the file in-place
                args = { "-i", "$FILENAME" },
                stdin = false,
                tmpfile_format = ".conform.$RANDOM.$FILENAME",
            },
        },
        formatters_by_ft = {
            cmake = { "cmakelangformat" },
            cpp = { "clang_format" },
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "ruff_fix", "black" },
            -- Use a sub-list to run only the first available formatter
            javascript = { "prettier" },
        },

        format_on_save = format_on_save,
        log_level = vim.log.levels.DEBUG,
    },
}
