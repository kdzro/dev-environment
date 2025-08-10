return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local dap_python = require("dap-python")

			dapui.setup({})
			require("nvim-dap-virtual-text").setup({ commented = true })

			local function py_bin()
				local venv = os.getenv("VIRTUAL_ENV")
				if venv and #venv > 0 then
					return venv .. "/bin/python"
				end
				return "python3"
			end
			dap_python.setup(py_bin())

			vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticSignError" })
			vim.fn.sign_define(
				"DapStopped",
				{ text = "", texthl = "DiagnosticSignWarn", linehl = "Visual", numhl = "DiagnosticSignWarn" }
			)

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			local function map(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true, desc = desc })
			end
			map("<leader>db", dap.toggle_breakpoint, "DAP: Toggle breakpoint")
			map("<leader>dc", dap.continue, "DAP: Continue/Start")
			map("<leader>do", dap.step_over, "DAP: Step Over")
			map("<leader>di", dap.step_into, "DAP: Step Into")
			map("<leader>dO", dap.step_out, "DAP: Step Out")
			map("<leader>dq", dap.terminate, "DAP: Terminate")
			map("<leader>du", dapui.toggle, "DAP: Toggle UI")
		end,
	},
}
