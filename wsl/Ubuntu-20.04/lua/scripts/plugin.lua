require("diffview").setup{}

require("octo").setup{}

require "plenary"

require("telescope").setup{
  defaults = {
    initial_mode = "normal",
  },
}
require("telescope").load_extension("harpoon")
require("telescope").load_extension("live_grep_args")

require("nvim-web-devicons").setup {
  default = true;
}
