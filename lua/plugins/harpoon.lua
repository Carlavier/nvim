return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup()

    vim.keymap.set('n', '<leader>ah', function() harpoon:list():replace_at(1) end, { desc = 'Harpoon [A]dd [h]' })
    vim.keymap.set('n', '<leader>aj', function() harpoon:list():replace_at(2) end, { desc = 'Harpoon [A]dd [j]' })
    vim.keymap.set('n', '<leader>ak', function() harpoon:list():replace_at(3) end, { desc = 'Harpoon [A]dd [k]' })
    vim.keymap.set('n', '<leader>al', function() harpoon:list():replace_at(4) end, { desc = 'Harpoon [A]dd [l]' })
    vim.keymap.set(
      'n',
      '<leader>h',
      function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = '[H]arpoon view list' }
    )

    vim.keymap.set('n', '<leader>h', function() harpoon:list():select(1) end, { desc = 'Harpoon go to [h]' })
    vim.keymap.set('n', '<leader>j', function() harpoon:list():select(2) end, { desc = 'Harpoon go to [j]' })
    vim.keymap.set('n', '<leader>k', function() harpoon:list():select(3) end, { desc = 'Harpoon go to [k]' })
    vim.keymap.set('n', '<leader>l', function() harpoon:list():select(4) end, { desc = 'Harpoon go to [l]' })
  end,
}
