vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.breakindent = true

vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.undofile = true

vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#FF0000' })

vim.opt.inccommand = 'split'

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.confirm = true

vim.opt.shortmess:append('I')

vim.api.nvim_set_hl(0, 'BlinkCmpGhostText', { bg = 'NONE', ctermbg = 'NONE' })
