require("catppuccin").setup({
	flavour = "frappe", -- macchiato (lighter), frappe (lightest), latte (whitest), mocha (light)
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

vim.g.material_style = "oceanic"

--vim.cmd[[ colorscheme material ]]
vim.cmd[[ colorscheme catppuccin ]]
