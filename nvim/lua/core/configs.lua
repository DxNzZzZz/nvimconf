vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- or "" to remove symbol
    spacing = 2,
    source = "always", -- show source of diagnostic
    format = function(diagnostic)
      return diagnostic.message
    end,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

