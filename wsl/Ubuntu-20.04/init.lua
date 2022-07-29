local lspconfig = require "lspconfig"
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

-- lsp diagnostic messages
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   underline = true,
   virtual_text = {
     spacing = 1,
   },
 }
)

-- NEOVIM LSP AUTOCOMPLETION
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local luasnip = require "luasnip"

local cmp = require "cmp"
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<M-j>'] = cmp.mapping.scroll_docs(-4),
    ['<M-k>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- Downloaded from lua-language-server releases
-- and put the sh on /usr/local/bin
lspconfig.sumneko_lua.setup {
  cmd = { "lua-language-server.sh" },
  filetypes = { "lua" },
  log_level = 2,
  root_dir = util.root_pattern(".luarc.json", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", ".git"),
  single_file_support = true,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
  capabilities = capabilities
}

-- Downloaded the vscode-language-server from npm
lspconfig.eslint.setup{
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
  },
  capabilities = capabilities
}

-- Downloaded from npm
lspconfig.intelephense.setup{
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  root_dir = util.root_pattern("composer.json", ".git"),
  capabilities = capabilities
}

-- Downloaded from npm
lspconfig.tsserver.setup{
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  init_options =  { hostInfo = "neovim" },
  root_dir = util.root_pattern("package.json", "tsconfig.json", ".git"),
  capabilities = capabilities
}
