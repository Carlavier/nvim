return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup({
      options = {
        middle_mouse_command = 'Bdelete %d',
        mode = 'buffers', -- Shows open files, not real Neovim tabs
        offsets = {
          {
            filetype = 'neo-tree', -- If you use neo-tree or nvim-tree
            text = 'File Explorer',
            text_align = 'left',
            separator = true,
          },
        },
      },
    })
  end,
}
