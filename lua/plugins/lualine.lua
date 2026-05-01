return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = '16color',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            color = function()
              local mode_colors = {
                n = '#0000ff',
                i = '#ff0000',
                v = '#bf00bf',
                V = '#bf00bf',
                [''] = '#bf00bf',
                R = '#208020',
              }

              local curr_mode = vim.fn.mode()
              if mode_colors[curr_mode] then return { bg = mode_colors[curr_mode], fg = '#ffffff', gui = 'bold' } end

              return nil
            end,
          },
        },

        lualine_z = {
          {
            'location',
            color = function()
              local mode_colors = {
                n = '#0000ff',
                i = '#ff0000',
                v = '#bf00bf',
                V = '#bf00bf',
                [''] = '#bf00bf',
                R = '#208020',
              }

              local curr_mode = vim.fn.mode()
              if mode_colors[curr_mode] then return { bg = mode_colors[curr_mode], fg = '#ffffff', gui = 'bold' } end

              return nil
            end,
          },
        },

        lualine_y = {
          {
            'progress',
            color = { bg = '#303030' },
          },
        },

        lualine_b = {
          {
            'branch',
            icons_enabled = true,
            color = { bg = '#303030' },
            separator = { right = '' },
          },

          {
            'diff',
            color = { bg = '#303030' },
            icons_enabled = true,
            separator = { right = '' },
          },

          {
            'diagnostics',
            color = { bg = '#303030' },
            icons_enabled = true,
            separator = { right = '' },
          },
        },
        lualine_c = {
          {
            function() return ' 󱉭  ' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t') end,
            color = { fg = '#ff9e64', gui = 'bold' },
            separator = '  ',
          },
          {
            'filename',
            file_status = true,
            path = 1,
          },
        },
      },
    })
  end,
}
