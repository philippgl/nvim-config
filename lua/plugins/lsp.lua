-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
    clangd = {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" },
    },
    -- gopls = {},
    -- pyright = {},
    -- run ":PylspInstall pylsp-mypy python-lsp-black pylsp-rope python-lsp-ruff"
    pylsp = {
        pylsp = {
            plugins = {
                mypy = { enabled = true },
                -- jedi_completion = { enabled = true },
                rope_completion = { enabled = true },
                black = { enabled = true },
                ruff = { enabled = true },
                -- pylint = { enabled = true },
            },
        },
    },
    rust_analyzer = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },
        },
    },
    -- tsserver = {},
    html = { filetypes = { "html", "twig", "hbs" } },

    lua_ls = {
        Lua = {
            diagnostics = {
                disable = { "missing-fields", "incomplete-signature-doc" },
            },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()

return {

    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        "hrsh7th/cmp-nvim-lsp",

        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { "j-hui/fidget.nvim", tag = "legacy", opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        { "folke/neodev.nvim", opts = {} },
    },

    config = function ()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        -- Ensure the servers above are installed
        require("mason").setup()
        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
        })

        mason_lspconfig.setup_handlers({
            ["rust_analyzer"] = function () end,
            function (server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                })
            end,
        })
        require "lspconfig".protols.setup({})
    end
}
