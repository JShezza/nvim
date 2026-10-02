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

			require('fidget').setup({})
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

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('lsp-group', { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set('n', keys, func, {
							buffer = event.buf,
							desc = 'LSP: ' .. desc,
						})
					end

					map('grn', vim.lsp.buf.rename, 'Rename')
					map('grr', vim.lsp.buf.references, 'References')
					map('gra', vim.lsp.buf.code_action, 'Goto Code Action')
					map('K', vim.lsp.buf.hover, 'Hover Documentation')
					map('gd', vim.lsp.buf.definition, 'Goto Definition')
				end,
			})
		end,
	},
}
