return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd([[colorscheme catppuccin-mocha]])
		end,
	},
	{
		"LunarVim/lunar.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			-- load the colorscheme here
			-- vim.cmd([[colorscheme lunar]])
		end,
	},
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
	{ "rebelot/kanagawa.nvim", priority = 1000, config = true },
	{
		"polirritmico/monokai-nightasty.nvim",
		lazy = false,
		priority = 1000,
		-- config = function(_, opts)
		-- 	vim.o.background = "dark" -- dark | light
		-- 	require("monokai-nightasty").load(opts)
		-- end,
	},
}
