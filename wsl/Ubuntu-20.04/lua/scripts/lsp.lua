local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- NEOVIM LSP AUTOCOMPLETION
--local snippetCompletionCapabilities = vim.lsp.protocol.make_client_capabilities()
--snippetCompletionCapabilities.textDocument.completion.completionItem.snippetSupport = true
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Downloaded the vscode-language-server from npm
lspconfig.eslint.setup({
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "vue", "svelte", "astro" },
	handlers = {
		["eslint/openDoc"] = function(_, result)
			if not result then
				return
			end
			local sysname = vim.loop.os_uname().sysname
			if sysname:match("Windows") then
				os.execute(string.format("start %q", result.url))
			elseif sysname:match("Linux") then
				os.execute(string.format("xdg-open %q", result.url))
			else
				os.execute(string.format("open %q", result.url))
			end
			return {}
		end,
		["eslint/confirmESLintExecution"] = function(_, result)
			if not result then
				return
			end
			return 4 -- approved
		end,
		["eslint/probeFailed"] = function()
			vim.notify("[lspconfig] ESLint probe failed.", vim.log.levels.WARN)
			return {}
		end,
		["eslint/noLibrary"] = function()
			vim.notify("[lspconfig] Unable to find ESLint library.", vim.log.levels.WARN)
			return {}
		end,
	},
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
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
		},
		codeActionOnSave = {
			enable = false,
			mode = "all",
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
			mode = "location",
		},
	},
  capabilities = capabilities
})

-- Downloaded from bashls
lspconfig.bashls.setup({
  capabilities = capabilities
})

-- Downloaded from npm
lspconfig.emmet_ls.setup({
  capabilities = capabilities
})

lspconfig.html.setup {
  filetypes = {"php", "html"},
  capabilities = capabilities,
}

-- Downloaded from npm
lspconfig.intelephense.setup({
  -- filetypes = { "php", "blade" },
  capabilities = capabilities
})

-- Downloaded the vscode-language-server from npm
lspconfig.jsonls.setup({
  capabilities = capabilities
})

-- Downloaded from github releases
lspconfig.marksman.setup({
  capabilities = capabilities
})

-- Downloaded from lua-language-server releases
-- and put the sh on /usr/local/bin
lspconfig.sumneko_lua.setup({
	cmd = { "lua-language-server.sh" },
	single_file_support = true,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
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
})

-- Downloaded from npm
lspconfig.tsserver.setup({
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  capabilities = capabilities
})
