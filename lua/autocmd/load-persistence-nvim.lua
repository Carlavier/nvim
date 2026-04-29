vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('persistence', { clear = true }),
  callback = function()
    if vim.fn.argc() == 0 then require('persistence').load() end
  end,
})
