vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function() require('guess-indent').set_from_buffer() end,
})
