vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function() vim.api.nvim_set_hl(0, 'FlashLabel', { fg = '#000000', bg = '#ff0000', bold = true }) end,
})
