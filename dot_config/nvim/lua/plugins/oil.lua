return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	keys = {
		{ "<leader>o", "<cmd>Oil<cr>", desc = "Oil" },
		{ "<leader>of", "<cmd>Oil --float .<cr>", desc = "Oil float" },
	},
}
