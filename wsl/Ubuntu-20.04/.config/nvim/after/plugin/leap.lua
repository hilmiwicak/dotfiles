local leap = require("leap")

leap.opts.safe_labels = {}

leap.opts.labels = {
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"m",
	"H",
	"L",
	"F",
	"t",
	"T",
	"{",
	"}",
	"\\",
	"|",
	"!",
	"#",
	"%",
	"*",
	"Q",
	"Z",
	"M",
	"+",
	"-",
	"_",
	"`",
	";",
	"'",
	'"',
	",",
}

leap.opts.special_keys = {
  next_target = "<enter>",
  prev_target = false,
  next_group = "<tab>",
  prev_group = "<s-tab>",
}

-- keymap
vim.keymap.set({"n", "x", "o"}, "<M-f>", "<Plug>(leap-forward-to)", { silent = true })
vim.keymap.set({"n", "x", "o"}, "<M-F>", "<Plug>(leap-backward-to)", { silent = true })
vim.keymap.set({"n", "x", "o"}, "gs", "<nop>")
