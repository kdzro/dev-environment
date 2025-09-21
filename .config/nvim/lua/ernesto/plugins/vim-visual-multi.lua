return {
	"mg979/vim-visual-multi",
	keys = {
		{
			"<leader>mc",
			"<Plug>(VM-Find-Under)",
			mode = "n",
			desc = "Vim-visual-multi: Seleção múltipla na palavra",
		},
		{
			"<leader>mc",
			"<Plug>(VM-Visual-Find)",
			mode = "v",
			desc = "Vim-visual-multi: Seleção múltipla na seleção",
		},
	},
	init = function()
		vim.g.vm_default_mappings = 0
		vim.g.vm_leader = {
			mode = "visual",
		}
		vim.g.vm_maps = {
			["Find Next"] = "j",
			["Find Prev"] = "k",
			["Skip Region"] = "n",
			["Exit"] = "<esc>",
		}
	end,
}
