local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
local custom_telescope = require("plugin_custom_mod.telescope")
local actions = require("telescope.actions")
local layout = require("telescope.actions.layout")

telescope.setup({
  defaults = {
    initial_mode = "insert",
    mappings = {
      n = {
        ["<C-s>"] = actions.select_vertical,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-v>"] = false,
        ["<C-x>"] = false,
        ["<M-?>"] = layout.toggle_preview,
        ["<M-K>"] = actions.preview_scrolling_up,
        ["<M-J>"] = actions.preview_scrolling_down,
      },
      i = {
        ["<C-s>"] = actions.select_vertical,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-v>"] = false,
        ["<C-x>"] = false,
        ["<M-?>"] = layout.toggle_preview,
        ["<M-j>"] = actions.move_selection_next,
        ["<M-k>"] = actions.move_selection_previous,
        ["<M-K>"] = actions.preview_scrolling_up,
        ["<M-J>"] = actions.preview_scrolling_down,
      },
    },
    file_ignore_patterns = {
      ".git/",
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    preview = {
      hide_on_startup = true,
      filesize_limit = 10,
      treesitter = true,
    },
  },
  fzf = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = "smart_case",
  },
})

-- keymap
vim.keymap.set('n', '<C-f>', function() return telescope.extensions.live_grep_args.live_grep_args() end)
vim.keymap.set('n', 'gd', function() return telescope_builtin.lsp_definitions() end)
vim.keymap.set('n', 'gD', function() return telescope_builtin.lsp_references() end)
vim.keymap.set('n', '<leader>lt', function() return telescope_builtin.lsp_document_symbols() end)
vim.keymap.set('n', '<leader>lh', function() return telescope_builtin.diagnostics({bufnr = 0}) end)
vim.keymap.set('n', '<leader>la', function() return telescope_builtin.diagnostics({root_dir = true, no_unlisted=true}) end)

vim.keymap.set('n', '<leader>to', function() return telescope_builtin.oldfiles() end)
vim.keymap.set('n', '<leader>th', function() return telescope_builtin.help_tags() end)

vim.keymap.set('n', '<M-p>', function() return custom_telescope.find({}) end)
vim.keymap.set('n', '<M-P>', function() return custom_telescope.find({hidden = true, no_ignore = true}) end)
vim.keymap.set('n', '<M-t>', function() return custom_telescope.buffers({}) end)
