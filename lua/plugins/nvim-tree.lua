return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			view = {
				width = 50,
			},
			renderer = {
				group_empty = true,
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
				},
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
				custom = { "node_modules", "^\\.git$" },
			},
		})

		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
		vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>", { silent = true })
	end,
}
