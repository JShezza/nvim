return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	opts = {
		variant = "moon",
		styles = {
			italic = false,
		},
	},

	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd("colorscheme rose-pine")
	end,
}
