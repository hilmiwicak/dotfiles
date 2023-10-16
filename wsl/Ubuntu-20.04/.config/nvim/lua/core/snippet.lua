local cmp = require("cmp")
local ls = require("luasnip")
local loader = require("luasnip.loaders.from_vscode")
local snippet_path = vim.fn.stdpath("config") .. "/snippets"

-- loader.load({ paths = {snippet_path} })

loader.lazy_load()
loader.lazy_load({ paths = { snippet_path } })

ls.filetype_extend("all", { "_" })

cmp.setup({
	snippet = {
		expand = function(args)
			ls.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<M-j>"] = cmp.mapping.scroll_docs(4),
		["<M-k>"] = cmp.mapping.scroll_docs(-4),
		["<C-Space>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.close()
			elseif not cmp.visible() then
				cmp.complete()
			else
				fallback()
			end
		end),
		-- ["<CR>"] = cmp.mapping.confirm(),
		["<CR>"] = cmp.mapping.confirm{
      select = false
    },
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif ls.expand_or_jumpable() then
				ls.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif ls.jumpable(-1) then
				ls.jump(-1)
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
