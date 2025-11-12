return {
   {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
   },

   {
      "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
      vim.cmd("colorscheme catppuccin-mocha")
    end,
   },

}

