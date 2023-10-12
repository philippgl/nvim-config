-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

local lga_actions = require("telescope-live-grep-args.actions")
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<C-u>"] = false,
                ["<C-d>"] = false,
            },
        },
    },
    extensions = {
        live_grep_args = {
            auto_quoting = false, -- enable/disable auto-quoting
            -- define mappings, e.g.
            mappings = { -- extend mappings
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt(),
                    ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                },
            },
        },
    },
})

require("telescope").load_extension("live_grep_args")
-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
