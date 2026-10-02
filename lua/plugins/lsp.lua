return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"lua_ls",
			"gopls",
			"pyright",
			"rust_analyzer",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
