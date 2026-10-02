return {
	'saghen/blink.cmp',
	version = '1.*',
	opts = {
		keymap = { preset = 'default' },
		appearance = { nerd_font_variant = 'mono' },
		completion = { menu = { auto_show = false, auto_show_delay_ms = 500 } },
		sources = {
			default = { 'lsp', 'path', 'snippets' },
		},
		fuzzy = { implementation = 'prefer_rust_with_warning' },
	},
}
