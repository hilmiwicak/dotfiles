local lspconfig = require("lspconfig")
--local util = require("lspconfig/util")

-- NEOVIM LSP AUTOCOMPLETION
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local luasnip = require("luasnip")

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<M-j>"] = cmp.mapping.scroll_docs(4),
		["<M-k>"] = cmp.mapping.scroll_docs(-4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
	},
})

cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

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
})

-- Downloaded from npm
lspconfig.emmet_ls.setup{}

-- Downloaded from npm
lspconfig.intelephense.setup{}

-- Downloaded the vscode-language-server from npm
lspconfig.jsonls.setup{}

-- Downloaded from github releases
lspconfig.marksman.setup{}

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
})

-- Downloaded from npm
lspconfig.tsserver.setup({
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
})
