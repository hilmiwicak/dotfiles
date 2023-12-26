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
    "groovy",
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
    "vimdoc",
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
      "blade",
      "html",
      "jsx",
      "javascript",
      "javascriptreact",
			"markdown",
      "php",
      "tsx",
			"typescript",
      "typescriptreact",
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
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["<leader>aa"] = "@parameter.outer",
				["<leader>ia"] = "@parameter.inner",
				["<leader>af"] = "@function.outer",
				["<leader>if"] = "@function.inner",
				["<leader>ac"] = "@class.outer",
				["<leader>ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		-- swap = {
		-- 	enable = true,
		-- 	swap_next = {
		-- 		["<leader>a"] = "@parameter.inner",
		-- 	},
		-- 	swap_previous = {
		-- 		["<leader>A"] = "@parameter.inner",
		-- 	},
		-- },
	},
})
