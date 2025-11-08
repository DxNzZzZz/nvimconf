return
{
  {
  "AckslD/nvim-neoclip.lua",
  dependencies = { "nvim-telescope/telescope.nvim" }, -- Or "ibhagwan/fzf-lua"
  config = function() require('neoclip').setup() end
  }
}
