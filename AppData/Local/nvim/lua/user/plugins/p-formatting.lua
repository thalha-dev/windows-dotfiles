return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		require("conform").format({ async = true, lsp_fallback = true })

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				bash = { "bashls" },
				-- xml = { "xmlformatter" },
				-- xml = {
					-- "C:\\Users\\thalha\\AppData\\Local\\nvim-data\\mason\\bin\\xmlformat.cmd",
				-- },
			},
			-- formatters = {
			-- 	xmlformatter = {
			-- 		command = " C:\\Users\\thalha\\AppData\\Local\\nvim-data\\mason\\bin\\xmlformat.cmd",
			-- 		args = { "--outfile", "$FILENAME" },
					-- range_args = function(ctx)
					-- 	return { "--line-start", ctx.range.start[1], "--line-end", ctx.range["end"][1] }
					-- end,
					-- stdin = true,
					-- cwd = require("conform.util").root_file({ ".editorconfig", "package.json" }),
					-- require_cwd = true,
					-- condition = function(ctx)
					-- 	return vim.fs.basename(ctx.filename) ~= "README.md"
					-- end,
					-- exit_codes = { 0, 1 },
					-- env = {
					-- 	VAR = "value",
					-- },
					-- inherit = true,
			-- 		prepend_args = { "$FILENAME" },
			-- 	},
			-- },
		})

		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 2000,
			})
		end, { desc = "Format file with conform" })
	end,
}
