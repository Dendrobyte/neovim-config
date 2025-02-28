vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Remap keys for window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true})
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true})
vim.keymap.set("n", "<C-k>", "<C-w>j", { noremap = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true})

vim.keymap.set("i", "<C-h>", "<C-w>h", { noremap = true})
vim.keymap.set("i", "<C-j>", "<C-w>j", { noremap = true})
vim.keymap.set("i", "<C-k>", "<C-w>j", { noremap = true})
vim.keymap.set("i", "<C-l>", "<C-w>l", { noremap = true})

-- Make the error lines show up
vim.keymap.set("n", "<leader>se", vim.diagnostic.open_float, { noremap = true, silent = true })

-- Setup harpoon stuff --
-- Once again, could also be moved to a different file... --
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>pm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end) -- pm for preview menu?

-- Telescope hotkeys. Could move these too --
local builtin = require('telescope.builtin')
-- Find files generally. Using 'p' for 'project'.
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
-- Find files in git
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Telescope find files within git' })
-- Search files function
-- TODO: Maybe pg for project grep? Something has been feeling unintuitive here.
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = 'Telescope project search files, per primeagen' })
