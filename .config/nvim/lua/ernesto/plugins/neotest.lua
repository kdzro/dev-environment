return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					args = { "--log-level", "DEBUG" },
					runner = "pytest",
				}),
			},
			keymap = {
				vim.keymap.set("n", "<leader>nr", function()
					require("neotest").run.run()
				end, { desc = "Run nearest test" }),

				vim.keymap.set("n", "<leader>nc", function()
					require("neotest").run.run(vim.fn.expand("%"))
				end, { desc = "Run current file" }),

				vim.keymap.set("n", "<leader>nd", function()
					require("neotest").run.run({ strategy = "dap" })
				end, { desc = "Debug the nearest test" }),

				vim.keymap.set("n", "<leader>nD", function()
					require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
				end, { desc = "Debug the current file" }),

				vim.keymap.set("n", "<leader>ns", function()
					require("neotest").run.stop()
				end, { desc = "Stop nearest test" }),

				vim.keymap.set("n", "<leader>na", function()
					require("neotest").run.attach()
				end, { desc = "Attach to the nearest test" }),

				vim.keymap.set("n", "<leader>nw", function()
					require("neotest").watch.toggle(vim.fn.expand("%"))
				end, { desc = "Watch files related to tests for changes and re-runs tests" }),

				vim.keymap.set("n", "<leader>no", function()
					require("neotest").output_panel.toggle()
				end, { desc = "Toggle output panel" }),

				vim.keymap.set("n", "<leader>nC", function()
					require("neotest").output_panel.clear()
				end, { desc = "Clear output panel" }),

				vim.keymap.set("n", "<leader>nS", function()
					require("neotest").summary.toggle()
				end, { desc = "Toggle summary window" }),
			},
		})
	end,
}
