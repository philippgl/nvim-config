-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

return {
    -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-symbols.nvim",
        "nvim-tree/nvim-web-devicons",
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = "make",
            cond = function ()
                return vim.fn.executable("make") == 1
            end,
        },
        -- {
        --     "nvim-telescope/telescope-live-grep-args.nvim",
        --     -- This will not install any breaking changes.
        --     -- For major updates, this must be adjusted manually.
        --     version = "^1.0.0",
        -- },
    },
    opts = {
        defaults = {
            mappings = {
                i = {
                    ["<C-u>"] = false,
                    ["<C-d>"] = false,
                },
            },
        },
    }
    -- config = function ()
    --     local lga_actions = require("telescope-live-grep-args.actions")
    --     require("telescope").setup({
    --         defaults = {
    --             mappings = {
    --                 i = {
    --                     ["<C-u>"] = false,
    --                     ["<C-d>"] = false,
    --                 },
    --             },
    --         },
    --         extensions = {
    --             live_grep_args = {
    --                 auto_quoting = false, -- enable/disable auto-quoting
    --                 -- define mappings, e.g.
    --                 mappings = {          -- extend mappings
    --                     i = {
    --                         ["<C-k>"] = lga_actions.quote_prompt(),
    --                         ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
    --                     },
    --                 },
    --             },
    --         },
    --     })
    --
    --     require("telescope").load_extension("live_grep_args")
    --     -- Enable telescope fzf native, if installed
    --     pcall(require("telescope").load_extension, "fzf")
    -- end
}
