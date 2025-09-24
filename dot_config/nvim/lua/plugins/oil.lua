return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	lazy = false,
	keys = {
		{ "<leader>o", "<cmd>Oil<cr>", desc = "Oil" },
		{ "<leader>of", "<cmd>Oil --float .<cr>", desc = "Oil float" },
	},
}
