return {
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',

		config = function()
			local parsers = {
				'lua',
				'luadoc',
				'vim',
				'vimdoc',
				'query',
				'javascript',
				'typescript',
				'tsx',
				'html',
				'css',
				'json',
				'go',
				'gitignore',
				'diff',
				'bash',
				'markdown',
				'markdown_inline',
			}
			require('nvim-treesitter').install(parsers)

			vim.api.nvim_create_autocmd({ 'FileType', 'BufEnter' }, {
				group = vim.api.nvim_create_augroup('Treesitter', {
					clear = true,
				}),
				callback = function(args)
					if vim.bo[args.buf].buftype ~= '' then
						return
					end

					local language = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)

					if not language or not vim.treesitter.language.add(language) then
						return
					end

					vim.treesitter.start(args.buf, language)
				end,
			})
		end,
	},
}
