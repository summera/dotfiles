return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"RRethy/nvim-treesitter-endwise",
		},
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"ruby",
			})

			opts.endwise = { enable = true }
		end,
	},
}
