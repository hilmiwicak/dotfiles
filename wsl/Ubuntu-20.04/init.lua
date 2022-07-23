require "plenary"
local telescope = require("telescope")
local nvim_web_devicons = require("nvim-web-devicons")
local octo = require("octo")
local diffview = require("diffview")

require("telescope").load_extension("live_grep_args")

nvim_web_devicons.setup {
  default = true;
}

octo.setup{}

diffview.setup{}

telescope.setup{}
