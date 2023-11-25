-- treesitter config
local treesitter_parser_dir = vim.fn.stdpath("data") .. "/parsers"
vim.opt.runtimepath:append({ treesitter_parser_dir })

require("nvim-treesitter.configs").setup({
	parser_install_dir = treesitter_parser_dir,
	ensure_installed = {
		"bash",
		"c",
		"css",
    "dart",
		"dockerfile",
		"go",
		"html",
		"javascript",
    "kotlin",
		"lua",
		"latex",
		"markdown",
		"php",
    "python",
		"regex",
		"rust",
		"typescript",
		"yaml",
	},
	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
		filetypes = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"tsx",
			"jsx",
			"php",
			"blade",
		},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<M-r>i",
			scope_incremental = "<M-r>s",
			node_incremental = "<M-r>n",
			node_decremental = "<M-r>N",
		},
	},
	-- textobjects = {
	-- 	select = {
	-- 		enable = true,
	-- 		lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
	-- 		keymaps = {
	-- 			-- You can use the capture groups defined in textobjects.scm
	-- 			["<leader>po"] = "@parameter.outer",
	-- 			["<leader>pi"] = "@parameter.inner",
	-- 			["<leader>fo"] = "@function.outer",
	-- 			["<leader>fi"] = "@function.inner",
	-- 			["<leader>co"] = "@class.outer",
	-- 			["<leader>ci"] = "@class.inner",
	-- 		},
	-- 	},
	-- 	move = {
	-- 		enable = true,
	-- 		set_jumps = true, -- whether to set jumps in the jumplist
	-- 		goto_next_start = {
	-- 			["<leader>nfs"] = "@function.outer",
	-- 			["<leader>ncs"] = "@class.outer",
	-- 		},
	-- 		goto_next_end = {
	-- 			["<leader>nfe"] = "@function.outer",
	-- 			["<leader>nce"] = "@class.outer",
	-- 		},
	-- 		goto_previous_start = {
	-- 			["<leader>pfs"] = "@function.outer",
	-- 			["<leader>pcs"] = "@class.outer",
	-- 		},
	-- 		goto_previous_end = {
	-- 			["<leader>pfe"] = "@function.outer",
	-- 			["<leader>pce"] = "@class.outer",
	-- 		},
	-- 	},
	-- 	swap = {
	-- 		enable = true,
	-- 		swap_next = {
	-- 			["<leader>sa"] = "@parameter.inner",
	-- 		},
	-- 		swap_previous = {
	-- 			["<leader>sp"] = "@parameter.inner",
	-- 		},
	-- 	},
	-- },
})
