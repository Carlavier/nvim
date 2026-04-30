local allModes = { 'n', 'v', 's', 'x', 'o' }

vim.keymap.set(allModes, 'j', 'h')
vim.keymap.set(allModes, 'l', 'j')
vim.keymap.set(allModes, ';', 'l')
vim.keymap.set(allModes, 'h', ';')

vim.keymap.set('n', '<C-z>', '<Nop>')

vim.keymap.set('n', '<C-Right>', 'w', { noremap = true })
vim.keymap.set('n', '<C-Left>', 'b', { noremap = true })

vim.keymap.set({ 'i', 'c' }, '<C-h>', '<C-w>')

vim.keymap.set({ 'n', 'v' }, 'p', 'gP')
vim.keymap.set({ 'n', 'v' }, 'P', 'p')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>qq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set(
  'n',
  '<leader>f',
  function()
    require('conform').format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    })
  end,
  { desc = '[F]ormat current buffer' }
)

vim.keymap.set('n', '<leader>qs', function() require('persistence').select() end, { desc = 'Select Session' })
vim.keymap.set(
  'n',
  '<leader>ql',
  function() require('persistence').load({ last = true }) end,
  { desc = 'Restore Last Session' }
)
vim.keymap.set('n', '<leader>qd', function() require('persistence').stop() end, { desc = "Don't Save Session" })

vim.keymap.set('n', '<leader>x', ':Bdelete<CR>', { desc = 'Close Buffer' })
vim.keymap.set('n', '<C-PageDown>', ':bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<C-PageUp>', ':bprev<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader>u', ':e #<CR>')

vim.keymap.set('n', '<leader>pf', ':Ex<CR>')
