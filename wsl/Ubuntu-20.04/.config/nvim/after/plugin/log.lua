local git_log = require("git-log")

git_log.setup({
	extra_args = {
		-- "log",
		-- "--all",
		"--graph",
		-- "--abbrev-commit",
		-- "--decorate",
		-- "--format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n''          %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)\n'",
	},
})

-- keymap
vim.keymap.set('n', '<leader>gl', function() git_log.check_log() end)
-- vim.keymap.set('x', '<leader>gl', ':lua require("git-log").check_log()<CR>')
-- vim.keymap.set('n', '<leader>gl', '<cmd>lua require("git-log").check_log()<CR>')
-- vim.keymap.set('x', '<leader>gl', ':lua require("git-log").check_log()<CR>')
