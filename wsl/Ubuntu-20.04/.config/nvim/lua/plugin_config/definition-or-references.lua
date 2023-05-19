local function handle_references_response(result)
  require("telescope.pickers")
    .new({}, {
      prompt_title = "LSP References",
      finder = require("telescope.finders").new_table({
        results = vim.lsp.util.locations_to_items(result, "utf-16"),
        entry_maker = require("telescope.make_entry").gen_from_quickfix(),
      }),
    })
  :find()
end

require("definition-or-references").setup({
  on_references_result = handle_references_response,
})
