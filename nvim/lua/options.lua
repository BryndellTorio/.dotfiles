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

-- Resource the config file.
vim.api.nvim_set_keymap("n", "<leader><leader>s", ":luafile %<CR>", {noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>e", ":Rexplore<CR>", {noremap = true, silent = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function ()
        vim.highlight.on_yank()
    end,
})

-- Understand this!! based from https://www.youtube.com/watch?v=m8C0Cq9Uv9o&t=103s
-- config = function ()
-- 	vim.api.nvim_create_autocmd("LspAttach", {
-- 		group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
-- 		callback = function ()
-- 			local map = function(keys, func, desc)
-- 				vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
-- 			end
--
-- 			map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
-- 			map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
-- 		end,
-- 	})
-- end,
