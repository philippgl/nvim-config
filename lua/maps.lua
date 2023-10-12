local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

local function nmap(lhs, rhs, options)
    map("n", lhs, rhs, options)
end

local function imap(lhs, rhs, options)
    map("i", lhs, rhs, options)
end

local tele = require("telescope.builtin")

-- See `:help telescope.builtin`
local find_unrestricted = function()
    tele.find_files({ find_command = { "rg", "--hidden", "--files", "--unrestricted" } })
end

local grep_args = function()
    require("telescope").extensions.live_grep_args.live_grep_args()
end

vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 0
vim.opt.timeout = true
vim.opt.timeoutlen = 1000

-- [t]elescope
nmap("<leader>t?", tele.oldfiles, { desc = "[?] Find recently opened files" })
nmap("<leader>t<space>", tele.buffers, { desc = "[ ] Find existing buffers" })
nmap("<leader>t/", tele.current_buffer_fuzzy_find, { desc = "[/] Find in buffer" })
nmap("<leader>tf", tele.find_files, { desc = "[f]iles" })
nmap("<leader>th", tele.help_tags, { desc = "[h]elp" })
nmap("<leader>tw", tele.grep_string, { desc = "Current [W]ord" })
nmap("<leader>tg", tele.live_grep, { desc = "[g]rep" })
nmap("<leader>ta", grep_args, { desc = "grep [a]rgs" })
nmap("<leader>td", tele.diagnostics, { desc = "[d]iagnostics" })
nmap("<leader>tr", tele.resume, { desc = "[r]esume" })
nmap("<leader>tb", tele.buffers, { desc = "Find existing [b]uffers" })
nmap("<leader>ti", tele.lsp_incoming_calls, { desc = "[i]ncoming calls" })
nmap("<leader>to", tele.lsp_outgoing_calls, { desc = "[o]utgoing calls" })
nmap("<leader>tl", tele.builtin, { desc = "[l]ist builtin" })
nmap("<leader>tm", tele.marks, { desc = "[m]arks" })
nmap("<leader>tr", tele.lsp_references, { desc = "[r]eferences" })
nmap("<leader>ts", tele.lsp_document_symbols, { desc = "[s]ymbols (document/lsp)" })
nmap("<leader>tt", tele.treesitter, { desc = "[t]reesitter" })
nmap("<leader>tu", find_unrestricted, { desc = "[u]nrestricted files" })
nmap("<leader>tw", tele.lsp_workspace_symbols, { desc = "[w]orkspace symbols" })

-- [f]uzzy search
nmap("<leader>f?", tele.oldfiles, { desc = "[?] Find recently opened files" })
nmap("<leader>f<space>", tele.buffers, { desc = "[ ] Find existing buffers" })
nmap("<leader>f/", tele.current_buffer_fuzzy_find, { desc = "[/] Find in buffer" })
nmap("<leader>ff", tele.find_files, { desc = "[f]iles" })
nmap("<leader>fh", tele.help_tags, { desc = "[h]elp" })
nmap("<leader>fw", tele.grep_string, { desc = "Current [W]ord" })
nmap("<leader>fg", tele.live_grep, { desc = "[g]rep" })
nmap("<leader>fa", grep_args, { desc = "grep [a]rgs" })
nmap("<leader>fd", tele.diagnostics, { desc = "[d]iagnostics" })
nmap("<leader>fr", tele.resume, { desc = "[r]esume" })
nmap("<leader>fb", tele.buffers, { desc = "Find existing [b]uffers" })
nmap("<leader>fi", tele.lsp_incoming_calls, { desc = "[i]ncoming calls" })
nmap("<leader>fo", tele.lsp_outgoing_calls, { desc = "[o]utgoing calls" })
nmap("<leader>fl", tele.builtin, { desc = "[l]ist builtin" })
nmap("<leader>fm", tele.marks, { desc = "[m]arks" })
nmap("<leader>fr", tele.lsp_references, { desc = "[r]eferences" })
nmap("<leader>fs", tele.lsp_document_symbols, { desc = "[s]ymbols (document/lsp)" })
nmap("<leader>ft", tele.treesitter, { desc = "[t]reesitter" })
nmap("<leader>fu", find_unrestricted, { desc = "[u]nrestricted files" })
nmap("<leader>fw", tele.lsp_workspace_symbols, { desc = "[w]orkspace symbols" })

-- [g]it
nmap("<leader>gf", tele.git_files, { desc = "[g]it [f]iles" })
-- " Find merge conflict markers
nmap("<leader>gc", "/\v^[<\\|=>]{7}( .*\\|$)<cr>", { desc = "[g]it [c]onflict marker" })

map({ "n", "v" }, ",", "<Nop>", { silent = true })

nmap("gd", vim.lsp.buf.definition, { desc = "[g]oto [d]efinition" })
nmap("gr", tele.lsp_references, { desc = "[G]oto [R]eferences" })
nmap("gI", tele.lsp_implementations, { desc = "[G]oto [I]mplementation" })
nmap("gt", vim.lsp.buf.type_definition, { desc = "[g]oto [t]ype definition" })

nmap("K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
nmap("<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })

-- Lesser used LSP functionality
nmap("gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "[W]orkspace [A]dd Folder" })
nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "[W]orkspace [R]emove Folder" })
nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "[W]orkspace [L]ist Folders" })

-- [b]uffer stuff
nmap("<leader>bd", vim.cmd.bdelete, { desc = "[d]elete" })
nmap("<leader>bu", "<cmd>bufdo update<cr>", { desc = "[u]pdate" })

-- [a]dvanced stuff
nmap("<leader>aa", vim.lsp.buf.code_action, { desc = "code [a]ction" })
nmap("<leader>ac", vim.lsp.buf.rename, { desc = "[c]hange name" })
nmap("<leader>ad", function()
    vim.diagnostic.open_float({ source = true })
end, { desc = "[d]iagnostic float" })
nmap("<leader>af", vim.lsp.buf.format, { desc = "[f]ormat" })
nmap("<leader>ah", vim.lsp.buf.hover, { desc = "[h]over" })
nmap("<leader>al", vim.diagnostic.setloclist, { desc = "diagnostics to [l]oclist" })
nmap("<leader>aq", vim.diagnostic.setqflist, { desc = "diagnostics to [q]uickfix list" })
nmap("<leader>as", vim.lsp.buf.signature_help, { desc = "[s]ignature help" })

nmap(",", "<plug>(leap-forward-to)", { desc = "leap" })
nmap("<leader>s", "<plug>(leap-forward-to)", { desc = "leap" })
nmap("<leader>S", "<plug>(leap-backward-to)", { desc = "leap backward" })
nmap("gs", "<plug>(leap-from-window)", { desc = "leap to other window" })
nmap("<leader>r", function()
    vim.o.relativenumber = not vim.o.rnu
end, {
    desc = "toggle [r]elative number",
})
nmap("<leader>d", "<c-w>", { desc = "win[d]ow functions" })

nmap("<leader><tab>", function()
    vim.o.expandtab = not vim.o.expandtab
end, { desc = "toggle expandtab [<tab>]" })

-- " fix undo
imap("<c-u>", "<c-g>u<c-u>")
imap("<c-w>", "<c-g>u<c-w>")

nmap("<leader>/", vim.cmd.nohlsearch, { desc = "nohlsearch" })
-- Diagnostic keymaps
nmap("[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
nmap("]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
nmap("<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
nmap("<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

nmap("Q", "<esc>")
-- " noremap <c-n>       <esc>:arge
nmap("<m-left>", vim.cmd.bprevious)
nmap("<m-right>", vim.cmd.bnext)
nmap("<c-left>", vim.cmd.previous)
nmap("<c-right>", vim.cmd.next)
nmap("<c-down>", vim.cmd.lnext)
nmap("<c-up>", vim.cmd.lprevious)
nmap("<m-down>", vim.cmd.cnext)
nmap("<m-up>", vim.cmd.cprevious)

nmap("S", "<space>")
nmap("Y", "y$")

nmap("<c-d>", "<c-d>zz")
nmap("<c-u>", "<c-u>zz")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")

nmap("+", function()
    vim.o.foldlevel = math.min(vim.o.foldlevel + 1, 15)
    print("foldlevel: " .. vim.o.foldlevel)
end)
nmap("-", function()
    vim.o.foldlevel = math.max(vim.o.foldlevel - 1, 0)
    print("foldlevel: " .. vim.o.foldlevel)
end)

-- " Shortcuts
-- " Change Working Directory to that of the current file
map("c", "cwd", "lcd %:p:h")
map("c", "cd.", "lcd %:p:h")

-- " Allow using the repeat operator with a visual selection (!)
-- " http://stackoverflow.com/a/8064607/127816
map("v", ".", ":normal .<cr>")

-- " For when you forget to sudo.. Really Write the file.
map("c", "w!!!", "w !sudo tee % >/dev/null")

-- " Easier horizontal scrolling
nmap("zl", "zL")
nmap("zh", "zH")

imap("X>>", "")
imap("O>>", "")
imap("X<<", "")
imap("O<<", "")

-- document existing key chains
require("which-key").register({
    ["<leader>a"] = { name = "[A]dvanced", _ = "which_key_ignore" },
    ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
    ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
    ["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
    ["<leader>t"] = { name = "[T]elescope", _ = "which_key_ignore" },
    ["<leader>f"] = { name = "[f]uzzy search (= telescope)", _ = "which_key_ignore" },
})

vim.api.nvim_command("command! -bang -nargs=* -complete=file E e<bang> <args>")
vim.api.nvim_command("command! -bang -nargs=* -complete=file W w<bang> <args>")
vim.api.nvim_command("command! -bang -nargs=* -complete=file Wq wq<bang> <args>")
vim.api.nvim_command("command! -bang -nargs=* -complete=file WQ wq<bang> <args>")
vim.api.nvim_command("command! -bang Wa wa<bang>")
vim.api.nvim_command("command! -bang WA wa<bang>")
vim.api.nvim_command("command! -bang Q q<bang>")
vim.api.nvim_command("command! -bang QA qa<bang>")
vim.api.nvim_command("command! -bang Qa qa<bang>")
