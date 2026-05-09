vim.keymap.set({'n', 'v'}, 'j', 'h', { noremap = true })
vim.keymap.set({'n', 'v'}, 'l', 'j', { noremap = true })
vim.keymap.set({'n', 'v'}, ';', 'l', { noremap = true })
vim.keymap.set({'n', 'v'}, 'h', ';', { noremap = true })

vim.keymap.set('n', '<leader>pf', '<cmd>Ex<cr>', { desc = "Default File Explorer" })

vim.keymap.set('i', '<C-h>', '<C-w>', { noremap = true, silent = true})
