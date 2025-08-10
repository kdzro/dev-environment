return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
	},
	config = function()
		local neotest = require("neotest")
		neotest.setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
					args = { "--log-level", "DEBUG" },
					runner = "pytest",
				}),
			},
		})

		vim.keymap.set("n", "<leader>nr", function()
			neotest.run.run()
		end, { desc = "Neotest: Run nearest" })
		vim.keymap.set("n", "<leader>nc", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { desc = "Neotest: Run file" })
		vim.keymap.set("n", "<leader>nd", function()
			neotest.run.run({ strategy = "dap" })
		end, { desc = "Neotest: Debug nearest" })
		vim.keymap.set("n", "<leader>nD", function()
			neotest.run.run({ vim.fn.expand("%"), strategy = "dap" })
		end, { desc = "Neotest: Debug file" })
		vim.keymap.set("n", "<leader>ns", function()
			neotest.run.stop()
		end, { desc = "Neotest: Stop" })
		vim.keymap.set("n", "<leader>na", function()
			neotest.run.attach()
		end, { desc = "Neotest: Attach" })
		vim.keymap.set("n", "<leader>nw", function()
			neotest.watch.toggle(vim.fn.expand("%"))
		end, { desc = "Neotest: Watch file" })
		vim.keymap.set("n", "<leader>no", function()
			neotest.output_panel.toggle()
		end, { desc = "Neotest: Output panel" })
		vim.keymap.set("n", "<leader>nC", function()
			neotest.output_panel.clear()
		end, { desc = "Neotest: Clear output" })
		vim.keymap.set("n", "<leader>nS", function()
			neotest.summary.toggle()
		end, { desc = "Neotest: Toggle Summary" })
	end,
}
