-- See `:help lualine.txt`

local function filefmt()
    if vim.bo.fileformat ~= "unix" then
        return vim.bo.fileformat
    end
    return ""
end

local function fileenc()
    if vim.bo.fileencoding ~= "utf-8" then
        return vim.bo.fileencoding
    end
    return ""
end

require("lualine").setup({
    options = {
        icons_enabled = false,
        theme = "gruvbox",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_b = {
            "branch",
            {
                "diff",
                diff_color = {
                    added = { fg = 2 },
                    modified = { fg = 3 },
                    removed = { fg = 1 },
                },
            },
            "diagnostics",
        },
        lualine_x = { filefmt, fileenc, "filetype" },
    },
})
