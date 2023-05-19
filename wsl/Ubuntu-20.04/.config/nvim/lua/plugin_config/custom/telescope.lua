local telescope_action_state = require("telescope.actions.state")
local tel_builtin = require("telescope.builtin")

local M = {}

M.buffers = function()
  tel_builtin.buffers({
    attach_mappings = function(_, map)

      local delete_select_buf = function()
        local buf_select = telescope_action_state.get_selected_entry()
        -- objective: delete selected buffer from the buffer list regardless it's currently open or not
        -- if the selected buffer is currently open and there are multiple tab
        -- └──  selected buf tab = telescope buf tab && list_tabpages > 1
        --      but what happen if the selected buffer is not open but in that current tab?
        --
        --  then open the last accessed tab
        --  remove selected buffer
        --
        -- if the selected buffer is currently open and only one tab
        -- └──  selected buf tab = telescope buf tab && list_tabpages = 1
        --  then open the last accessed buf
        --  remove selected buffer
        --
        -- if it doesn't
        --  just remove it

        vim.api.nvim_buf_delete(buf_select.bufnr, { force = true })
        -- print(vim.inspect(buf_select))
        require("plugin_config.custom.telescope").buffers()
      end

      map("i", "<M-d>", delete_select_buf)
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

    map("i", "<C-y>", yank_select_buf_clip)
    map("n", "Y", yank_select_buf_clip)
    return true
  end
  tel_builtin.find_files(opts)
end

return M
