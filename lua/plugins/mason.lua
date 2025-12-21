return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      local path = require("mason-core.path")
      opts.install_root_dir = path.concat { vim.fn.stdpath "data", "mason" }
      opts.PATH = "append"
      opts.log_level = vim.log.levels.INFO
      opts.max_concurrent_installers = 4
      opts.registries = {
        "github:mason-org/mason-registry",
      }
      opts.providers = {
        "mason.providers.registry-api",
        "mason.providers.client",
      }
      opts.github = {
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
      }
      opts.pip = {
        upgrade_pip = false,
        install_args = {},
      }
      opts.ui = {
        check_outdated_packages_on_open = true,
        border = nil,
        backdrop = 60,
        width = 0.8,
        height = 0.9,
        icons = {
          package_installed = "◍",
          package_pending = "◍",
          package_uninstalled = "◍",
        },
        keymaps = {
          toggle_package_expand = "<CR>",
          install_package = "i",
          update_package = "u",
          check_package_version = "c",
          update_all_packages = "U",
          check_outdated_packages = "C",
          uninstall_package = "X",
          cancel_installation = "<C-c>",
          apply_language_filter = "<C-f>",
          toggle_package_install_log = "<CR>",
          toggle_help = "g?",
        },
      }
    end,
  config=function ()
  require("mason").setup({})
  end,
  },
  }
