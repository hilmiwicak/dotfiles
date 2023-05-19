vim.g.user_emmet_leader_key = "<M-m>"
local user_emmet_settings = {
  ["php"] = {
    ["extends"] = "html",
    ["filters"] = "c",
  },
  ["xml"] = {
    ["extends"] = "html",
  },
}
vim.g.user_emmet_settings = user_emmet_settings
