return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				python = { "isort", "black" },
				java = { "google-java-format" },
				cpp = { "clang-format" },
				c_sharp = { "csharpier" },
				lua = { "stylua" },
				json = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({ lsp_fallback = true, async = false, timeout_ms = 3000 })
		end, { desc = "Conform: Format file or range" })
	end,
}
