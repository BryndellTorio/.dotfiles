vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"
-- vim.opt.scrolloff = 999

vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })

-- Resource the config file.
vim.api.nvim_set_keymap("n", "<leader><leader>s", ":luafile %<CR>", {
    desc = "Command to resource the files.",
    noremap = true,
    silent = true
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- NOTE: Turn off search highlighting when cursor moved.
vim.api.nvim_set_keymap("n", "<leader>nh", ":lua vim.cmd('nohlsearch')<CR>", {
    desc = "keymap to remove search highlight.",
    noremap = true,
    silent = true,
})

function ToggleExplore()
    if vim.b.netrw_browser_active then
        vim.cmd("Rexplore")
    else
        vim.cmd("Explore")
    end
end

vim.api.nvim_set_keymap("n", "<leader>e", ":lua ToggleExplore()<CR>", {
    desc = "Use builtin netrw to navigate file tree.",
    noremap = true,
    silent = true,
})


-- Force an Esc remap to Esc.
vim.api.nvim_set_keymap("i", "<Esc>", "<Esc>", { noremap = true, silent = true })
