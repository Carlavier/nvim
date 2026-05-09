vim.keymap.set({'n', 'v'}, 'j', 'h', { noremap = true })
vim.keymap.set({'n', 'v'}, 'l', 'j', { noremap = true })
vim.keymap.set({'n', 'v'}, ';', 'l', { noremap = true })
vim.keymap.set({'n', 'v'}, 'h', ';', { noremap = true })

vim.keymap.set('n', '<leader>pf', '<cmd>Ex<cr>', { desc = "Default File Explorer" })

vim.keymap.set('i', '<C-h>', '<C-w>', { noremap = true, silent = true})
vim.keymap.set('c', '<C-h>', '<C-w>', { noremap = true })

vim.keymap.set('n', '<M-j>', '<C-w>h', { noremap = true, })
vim.keymap.set('n', '<M-k>', '<C-w>k', { noremap = true, })
vim.keymap.set('n', '<M-l>', '<C-w>j', { noremap = true, })
vim.keymap.set('n', '<M-;>', '<C-w>l', { noremap = true, })
