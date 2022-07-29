local util = require "lspconfig/util"

require("diffview").setup{}

require("octo").setup{}

require "plenary"

require("telescope").setup{}
require("telescope").load_extension("harpoon")
require("telescope").load_extension("live_grep_args")

require("nvim-web-devicons").setup {
  default = true;
}

require"nvim-treesitter.configs".setup {
  parser_install_dir = "~/.config/nvim/parsers",
  ensure_installed = { "c", "php", "javascript", "typescript" },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
}

require"lspconfig".intelephense.setup{
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  root_dir = util.root_pattern("composer.json", ".git")
}

require"lspconfig".eslint.setup{
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx" },
  handlers = {
      ['eslint/openDoc'] = function(_, result)
        if not result then
          return
        end
        local sysname = vim.loop.os_uname().sysname
        if sysname:match 'Windows' then
          os.execute(string.format('start %q', result.url))
        elseif sysname:match 'Linux' then
          os.execute(string.format('xdg-open %q', result.url))
        else
          os.execute(string.format('open %q', result.url))
        end
        return {}
      end,
      ['eslint/confirmESLintExecution'] = function(_, result)
        if not result then
          return
        end
        return 4 -- approved
      end,
      ['eslint/probeFailed'] = function()
        vim.notify('[lspconfig] ESLint probe failed.', vim.log.levels.WARN)
        return {}
      end,
      ['eslint/noLibrary'] = function()
        vim.notify('[lspconfig] Unable to find ESLint library.', vim.log.levels.WARN)
        return {}
      end,
  },
  -- on_new_config
  root_dir = util.root_pattern(
    '.eslintrc',
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    '.eslintrc.json',
    'package.json'
  ),
  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine"
      },
      showDocumentation = {
        enable = true
      }
    },
    codeActionOnSave = {
      enable = false,
      mode = "all"
    },
    format = true,
    nodePath = "",
    onIgnoredFiles = "off",
    packageManager = "npm",
    quiet = false,
    rulesCustomizations = {},
    run = "onType",
    useESLintClass = false,
    validate = "on",
    workingDirectory = {
      mode = "location"
    }
  }
}

require"lspconfig".tsserver.setup{
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  init_options =  { hostInfo = "neovim" },
  root_dir = util.root_pattern("package.json", "tsconfig.json", ".git")
}
