local telescope_action_state = require("telescope.actions.state")

local M = {}

M.buffers = function()
  require("telescope.builtin").buffers({
    attach_mappings = function(_, map)
      local delete_select_buf = function()
        local buf_select = telescope_action_state.get_selected_entry()
        vim.api.nvim_buf_delete(buf_select.bufnr, { force = true })
        require("scripts.after.telescope").buffers()
      end

      map("n", "dd", delete_select_buf)
      return true
    end,
  })
end

M.find = function(opts)
  if not opts.hidden then
    opts.hidden = false
  elseif not opts.not_ignore then
    opts.not_ignore = false
  end
  opts.attach_mappings = function(_, map)
    local yank_select_buf_clip = function()
      local buf_select = telescope_action_state.get_selected_entry()
      vim.fn.setreg('+', buf_select[1])
      print("Done yanking selected entry into clipboard!")
    end

    map("n", "Y", yank_select_buf_clip)
    return true
  end
  require("telescope.builtin").find_files(opts)
  -- require("telescope.builtin").find_files({
  --   attach_mappings = function(_, map)
  --   end
  -- }, opts)
end

return M
