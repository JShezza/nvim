return {
	{
		'mason-org/mason-lspconfig.nvim',
		opts = {
			ensure_installed = {
				'lua_ls',
				'gopls',
				'pyright',
				'rust_analyzer',
			},
			automatic_enable = true,
		},
		dependencies = {
			{
				'mason-org/mason.nvim',
				opts = {
					ui = {
						icons = {
							package_installed = '✓',
							package_pending = '➜',
							package_uninstalled = '✗',
						},
					},
				},
			},
			'neovim/nvim-lspconfig',
			'j-hui/fidget.nvim',
		},
		config = function(_, opts)
			-- Configure lua_ls specifically
			vim.lsp.config('lua_ls', {
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
						},
						diagnostics = {
							globals = { 'vim' },
						},
						workspace = {
							library = { vim.env.VIMRUNTIME },
							checkThirdParty = false,
						},
					},
				},
			})

			require('mason-lspconfig').setup(opts)

			vim.diagnostic.config({
				update_in_insert = false,
				float = {
					focusabled = false,
					style = 'minimal',
					border = 'rounded',
					source = 'if_many',
					header = '',
					prefix = '',
				},
				underline = { sverity = { min = vim.diagnostic.severity.WARN } },
				virtual_text = true,
				virtual_lines = false,
			})
		end,
	},
}
