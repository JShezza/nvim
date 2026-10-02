return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			timeout_ms = 3000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			go = { "gofmt" },
			c = { "clang-format" },
			cpp = { "clang-format" },
		},
		formatters = {
			stylua = {
				prepend_args = { "--quote-style", "AutoPreferSingle" },
			},
			prettier = {
				prepend_args = { "--single-quote" },
			},
		},
	},
}
