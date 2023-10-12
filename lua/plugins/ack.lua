if vim.fn.executable "rg" then
    vim.g.ackprg = "rg --vimgrep"
elseif vim.fn.executable "ag" then
    vim.g.ackprg = "ag --vimgrep"
end

return {
    "mileszs/ack.vim",
}
