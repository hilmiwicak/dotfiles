require("catppuccin").setup({
	flavour = "macchiato", -- macchiato, frappe, latte, mocha
  -- setup for full black catppuccin
	--flavour = "mocha",
	--color_overrides = {
	--	mocha = {
	--		base = "#000000",
	--	},
	--},
	--integrations = {
	--	nvimtree = true,
	--},
	--highlight_overrides = {
	--	mocha = function(mocha)
	--		return {
	--			NvimTreeNormal = { bg = mocha.none },
	--		}
	--	end,
	--},
})

vim.cmd[[ colorscheme catppuccin ]]
