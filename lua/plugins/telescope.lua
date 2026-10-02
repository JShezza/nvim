return {
	'nvim-telescope/telescope.nvim',
	version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- optional but recommended
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		'nvim-telescope/telescope-ui-select.nvim',
	},

	config = function()
		local telescope = require('telescope')
		local builtin = require('telescope.builtin')

		telescope.setup({
			extensions = {
				['ui-select'] = { require('telescope.themes').get_dropdown() },
			},
		})
		telescope.load_extension('fzf')
		telescope.load_extension('ui-select')

		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[s]earch [f]iles' })
		vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[s]earch live [g]rep' })
		vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Search buffers' })
		vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[s]earch [h]elp tags' })
		vim.keymap.set('n', '<leader>sr', builtin.git_files, { desc = '[s]earch git [r]epo' })
		vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[s]earch current [w]ord' })
		vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[s]earch [d]iagnostics' })
	end,
}
