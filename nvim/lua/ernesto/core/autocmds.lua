local augroup = vim.api.nvim_create_augroup("TmuxStatus", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup,
	callback = function()
		if vim.env.TMUX then
			vim.fn.system("tmux set -g status off")
		end
	end,
})

vim.api.nvim_create_autocmd("VimLeave", {
	group = augroup,
	callback = function()
		if vim.env.TMUX then
			vim.fn.system("tmux set -g status on")
		end
	end,
})
