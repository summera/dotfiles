return {
	"summera/golden-ratio",
	branch = "exclude-filetypes",
	event = "WinEnter",
	cmd = {
		"GoldenRatioResize",
		"GoldenRatioToggle",
		"GoldenRatioEnable",
		"GoldenRatioDisable",
	},
	init = function()
		vim.g.golden_ratio_autocommand = 0
	end,
	config = function()
		vim.g.golden_ratio_exclude_filetypes = {
			"snacks_picker_list",
			"snacks_layout_box",
			"snacks_picker_input",
		}
	end,
	keys = {
		{ "<leader>gt", "<cmd>GoldenRatioToggle<CR>", desc = "Toggle golden-ratio" },
		{ "<leader>gr", "<cmd>GoldenRatioResize<CR>", desc = "Resize golden-ratio" },
	},
}
