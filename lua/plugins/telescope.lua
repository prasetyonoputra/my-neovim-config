return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('telescope').setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules/.*",
					"%.git/.*",
					"%.next/.*"
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					no_ignore = true,
				},
				live_grep = {
					additional_args = function()
						return { "--hidden", "--no-ignore" }
					end
				},
			},
		})

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	end
}
