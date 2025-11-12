vim.wo.number = true
vim.opt.relativenumber = true

vim.opt.wrap=false

vim.opt.splitbelow=true
vim.opt.splitright=true

vim.opt.expandtab=true
vim.opt.shiftwidth=3  
vim.opt.tabstop=3

vim.opt.clipboard="unnamedplus"

vim.opt.scrolloff=999

vim.opt.virtualedit = "block"

vim.opt.ignorecase=true

vim.opt.termguicolors=true

vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 100}
  end,
})
