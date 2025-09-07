return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"williamboman/mason.nvim",
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
			"theHamsta/nvim-dap-virtual-text",
			"jbyuki/one-small-step-for-vimkind",
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

			dap.adapters.codelldb = {
				type = "executable",
				command = "codelldb",
			}

			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					stopOnEntry = false,
				},
			}

			dap.adapters.coreclr = {
				type = "executable",
				command = function()
					local mason_registry = require("mason-registry")
					local netcoredbg_pkg = mason_registry.get_package("netcoredbg")
					if not netcoredbg_pkg:is_installed() then
						vim.notify(
							"Debugger netcoredbg não está instalado. Por favor, instale-o com :Mason",
							vim.log.levels.ERROR
						)
						return
					end
					return netcoredbg_pkg:get_install_path() .. "/netcoredbg"
				end,
				args = { "--interpreter=vscode" },
			}

			dap.configurations.cs = {
				{
					type = "coreclr",
					name = "launch - netcoredbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net9.0/", "file")
					end,
				},
			}

			dap.adapters.nlua = function(callback, config)
				callback({
					type = "server",
					host = config.host or "127.0.0.1",
					port = config.port or 8086,
				})
			end

			dap.configurations.lua = {
				{
					type = "nlua",
					request = "attach",
					name = "Attach to running Neovim instance",
				},
			}

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
			map("<leader>dl", function()
				require("osv").launch({ port = 8086 })
			end, "DAP: Start Lua debug server")
		end,
	},
}
