return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			timeout_ms = 3000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			go = { "gofmt" },
			c = { "clang-format" },
			cpp = { "clang-format" },
		},
	},
}
