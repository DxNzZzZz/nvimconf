return {
  {
    "nvim-mini/mini.icons",
    version = false, -- always use latest
    config = function()
      local icons = require("mini.icons")

      icons.setup({
        style = "glyph", -- use "ascii" if your terminal doesn't support Nerd Fonts
      })
      icons.mock_nvim_web_devicons()
    end,
  },
}
