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

vim.keymap.set('n', '<M-j>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<M-;>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<M-l>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>f', '<cmd>w<CR>', { desc = '[F]ormat and save' })

vim.keymap.set('n', '<leader>qs', function() require('persistence').select() end, { desc = 'Select Session' })
vim.keymap.set(
  'n',
  '<leader>ql',
  function() require('persistence').load({ last = true }) end,
  { desc = 'Restore Last Session' }
)
vim.keymap.set('n', '<leader>qd', function() require('persistence').stop() end, { desc = "Don't Save Session" })

vim.keymap.set('n', '<leader>x', '<cmd>Bdelete<CR>', { desc = 'Close Buffer' })
vim.keymap.set('n', '<C-PageDown>', '<cmd>bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<C-PageUp>', '<cmd>bprev<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader>t', '<cmd>e #<CR>')

vim.keymap.set('n', '<leader>pf', '<cmd>Ex<Enter>')

vim.keymap.set('n', 'gd', function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })

  if #clients > 0 then
    vim.lsp.buf.definition()
  else
    vim.cmd('normal! gd')
  end
end, { desc = 'LSP definition with fallback to built-in gd' })

vim.keymap.set(
  'n',
  ']d',
  function() vim.diagnostic.jump({ count = 1, float = true }) end,
  { desc = 'Go to next diagnostic' }
)
vim.keymap.set(
  'n',
  '[d',
  function() vim.diagnostic.jump({ count = -1, float = true }) end,
  { desc = 'Go to previous diagnostic' }
)

vim.keymap.set('n', '<leader>u', '<cmd>Undotree<CR>')

vim.keymap.set('n', 'dic', 'di{', { desc = '[D]elete [I]nside [C]urly bracket' })
vim.keymap.set('n', 'dis', 'di[', { desc = '[D]elete [I]nside [S]quare bracket' })
vim.keymap.set('n', 'cic', 'di{', { desc = '[C]change [I]nside [C]urly bracket' })
vim.keymap.set('n', 'cis', 'di[', { desc = '[C]change [I]nside [S]quare bracket' })
