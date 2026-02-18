return {
	{
		"nvim-treesitter/nvim-treesitter",
		tag = "v0.10.0",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = {
					"go", "typescript", "tsx", "javascript",
					"html", "lua", "markdown", "markdown_inline"
				},
				highlight = {
					enable = true,
				},
				indent = {
					enable = true
				},
			})
		end,
	},
}
