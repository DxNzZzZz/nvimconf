function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end
vim.g.mapleader = " "

--window managment
Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
Map("n", "<C-l>", "<C-w>l")
--neotree
Map("n","|","<cmd>Neotree reveal<cr>")

Map("n", "<C-Up>", ":resize -2<CR>")
Map("n", "<C-Down>", ":resize +2<CR>")
Map("n", "<C-Left>", ":vertical resize -2<CR>")
Map("n", "<C-Right>", ":vertical resize +2<CR>")

Map("n","<leader>e",":Neotree<CR>")

local wk = require("which-key")
wk.add({
      {"<leader>s",group = "Save"},
      {"<leader>ss","<cmd>w<CR>",desc ="Save"},
      {"<leader>sq","<cmd>wa<cr><cmd>qa<cr>",desc="Save and Quit All"},
      {"<leader>sa","<cmd>wa<cr>",desc="Save All"},

      { "<leader>q",group ="Quit"},
      { "<leader>qa","<cmd>qa<CR>",desc="Quit All"},
      { "<leader>qq","<cmd>q<CR>",desc="Quit Curr"},
      {"<leader>qQ","<cmd>q!<cr>",desc="Quit without Saving"},
      {"<leader>qA","<cmd>qa!<cr>",desc="Quit All without Saving"},

      {"<leader>r",group="Run"},
      {"<leader>rj","<cmd>JavaRun<cr>",desc="Run a java file"},

--      {"<leader>t",group="Tabs"},
--       {"<leader>th","<cmd>tabn<cr>",desc="Precious Tab"},
--       {"<leader>tl","<cmd>tabp<cr>",desc="Next Tab"},
--       {"<leader>tn","<cmd>tabnew<cr>",desc="New Tab"},
      {"<leader>b",group="Buffer"},
      {"<leader>bl","<cmd>BufferLineCycleNext<cr>",desc="Buffer Line Next"},
      {"<leader>bh","<cmd>BufferLineCyclePrev<cr>",desc="Buffer Line Previous"},
      {"<leader>bd",group="Buffer Delete"},
      {"<leader>bdh","<cmd>BufferLineCloseLeft<cr>",desc="Buffer Line Delete all to the left"},
      {"<leader>bdl","<cmd>BufferLineCloseRight<cr>",desc="Buffer Line Delete all to the right"},

      {"<leader>f",group="Find"},
      {"<leader>ff","<cmd>Telescope find_files hidden=true<cr>",desc="Find Files"},
      {"<leader>fg","<cmd>Telescope live_grep<cr>",desc="Live Grep"},
      {"<leader>fc","<cmd>Telescope colorscheme<cr>",desc="Colorschemes"},
      {"<leader>a",desc="add to harpoon"},

      {"<leader>o",desc="Open"},
      {"<leader>ols","<cmd>LiveServerStart<cr>",desc="start Live Server and open it in browser"},
})



local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

