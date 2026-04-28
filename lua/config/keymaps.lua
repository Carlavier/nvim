local allModes = {'n', 'v', 's', 'x', 'o'}

vim.keymap.set(allModes, 'j', 'h')
vim.keymap.set(allModes, 'l', 'j')
vim.keymap.set(allModes, ';', 'l')
vim.keymap.set(allModes, 'h', ';')

vim.keymap.set('n', '<C-z>', '<Nop>')

vim.keymap.set('n', '<C-Right>', 'w', { noremap = true })
vim.keymap.set('n', '<C-Left>', 'b', { noremap = true })

vim.keymap.set({'i', 'c'}, '<C-h>', '<C-w>')

vim.keymap.set({"n", "v"}, "p", "gP")
vim.keymap.set({"n", "v"}, "P", "p")
