-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.

require("lazy").setup({
    -- NOTE: First, some plugins that don't require any configuration

    -- Git related plugins
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",

    -- Detect tabstop and shiftwidth automatically
    "tpope/vim-sleuth",

    -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",

    -- "gc" to comment visual regions/lines
    "numToStr/Comment.nvim",

    -- more navigation options
    "ggandor/leap.nvim",
    "mrcjkb/rustaceanvim",
    "tidalcycles/vim-tidal",

    -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/plugins/*.lua`
    { import = "plugins" },
}, {})
