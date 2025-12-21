-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  require('plugins.lspconf'),  -- lspconfig FIRST (populates vim.lsp.config)
  require('plugins.telescope'),
  require('plugins.neotree'),
  require('plugins.treesitter'),
  require('plugins.colorscheme'),
  require('plugins.nvim-cmp'),
  require('plugins.mason'),
  require('plugins.mason-lsp'),  -- mason-lsp AFTER lspconfig
  require('plugins.which-key'),
  require('plugins.mini-icons'),
  require('plugins.alpha'),
  require('plugins.harpoon2'),
  require('plugins.yanker'),
  require('plugins.fzf-native'),
  require('plugins.liveserver'),
  require('plugins.rustacea'),
})
