local allModes = { 'n', 'v', 's', 'x', 'o' }

vim.keymap.set(allModes, 'j', 'h')
vim.keymap.set(allModes, 'l', 'j')
vim.keymap.set(allModes, ';', 'l')
vim.keymap.set(allModes, 'h', ';')

vim.keymap.set('n', '<C-z>', '<Nop>')

vim.keymap.set('n', '<C-Right>', 'w', { noremap = true })
vim.keymap.set('n', '<C-Left>', 'b', { noremap = true })

vim.keymap.set({ 'i', 'c' }, '<C-h>', '<C-w>')

vim.keymap.set('v', 'p', '"_dP')
vim.keymap.set('v', 'P', '"_dp')

vim.keymap.set('n', 'p', 'gP')
vim.keymap.set('n', 'P', 'p')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<M-j>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<M-;>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<M-l>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>f', '<cmd>w<CR>', { desc = '[F]ormat and save' })

vim.keymap.set('n', '<C-PageDown>', '<cmd>bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<C-PageUp>', '<cmd>bprev<CR>', { desc = 'Previous Buffer' })

vim.keymap.set('n', '<leader>pf', '<cmd>Ex<Enter>')

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

vim.keymap.set('n', '<leader>o', function()
  local lines = {}
  for _ = 1, vim.v.count1 do
    table.insert(lines, '')
  end
  vim.api.nvim_put(lines, 'l', true, true)
end, { desc = 'Add empty line below' })

vim.keymap.set('n', '<leader>O', function()
  local lines = {}
  for _ = 1, vim.v.count1 do
    table.insert(lines, '')
  end
  vim.api.nvim_put(lines, 'l', false, true)
end, { desc = 'Add empty line above' })
