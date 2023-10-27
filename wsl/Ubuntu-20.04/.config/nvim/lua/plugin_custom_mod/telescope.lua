local telescope_action_state = require("telescope.actions.state")
local tel_builtin = require("telescope.builtin")

local M = {}

M.buffers = function(opts)
  opts.attach_mappings = function(_, map)

    local delete_select_buf = function()
      local buf_select = telescope_action_state.get_selected_entry()

      -- objective: delete selected buffer from the buffer list regardless it's currently open or not

      -- if vim.fn.expand("#") ~= "" and buf_select.bufnr == vim.api.nvim_get_current_buf() then
      --   vim.cmd("b #")
      -- elseif vim.fn.expand("#") == "" and buf_select.bufnr == vim.api.nvim_get_current_buf() then
      --   print("masuk enew")
      --   vim.cmd("enew!")
      -- end
      -- vim.api.nvim_buf_delete(buf_select.bufnr, { force = true })

      vim.api.nvim_buf_delete(buf_select.bufnr, { force = true })
      require("plugin_config.custom.telescope").buffers({})
    end

    map("i", "<M-d>", delete_select_buf)
    map("n", "dd", delete_select_buf)
    return true
  end

  tel_builtin.buffers(opts)
end

M.find = function(opts)
  -- if not opts.hidden then
  --   opts.hidden = false
  -- elseif not opts.not_ignore then
  --   opts.not_ignore = false
  -- end
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
