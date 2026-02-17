return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "gopls", "html", "cssls", "tailwindcss", "eslint", "lua_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(event)
					local opts = { buffer = event.buf, silent = true }
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
				end,
			})

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = true,
				severity_sort = true,
			})

			local servers = { "ts_ls", "gopls", "html", "cssls", "tailwindcss", "eslint" }
			for _, lsp in ipairs(servers) do
				vim.lsp.enable(lsp)
			end

			vim.lsp.config('lua_ls', {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})
			vim.lsp.enable('lua_ls')
		end,
	}
}
