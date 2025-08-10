<h1 align="center">
    Personal dev configuration
</h1>

| nvim                                                                                                            | terminal                                                                                                        |
| --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| <center><img src = "https://github.com/user-attachments/assets/928fce44-c7f0-41de-bbd4-919c678c7fa4"/></center> | <center><img src = "https://github.com/user-attachments/assets/a79f86ae-1d16-4ef7-a8b2-0435b8e82895"/></center> |

<div align="center">

![Static Bagde](https://img.shields.io/badge/Neovim-kdzro-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white)

</div>

## What i'm using

- [WSL2](https://github.com/microsoft/WSL)
- [zsh](https://github.com/ohmyzsh/ohmyzsh)
- [tmux](https://github.com/tmux/tmux)
- [neovim](https://github.com/neovim/neovim)
- [eza](https://github.com/eza-community/eza)

## Terminal setup

I'm currently using [WezTerm](https://wezterm.org/index.html) along with zsh. You can configure the terminal in [wezterm.lua](https://github.com/kdzro/dev-environment/blob/main/wezterm.lua) file.

For zsh, you need to install these three plugins:

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)
- web-search

and this zsh theme:

- [powerlevel10k](https://github.com/romkatv/powerlevel10k)

### **Relevant files:**

- [wezterm.lua](https://github.com/kdzro/dev-environment/blob/main/wezterm.lua)
- [.zshrc](https://github.com/kdzro/dev-environment/blob/main/.zshrc)

## Tmux setup

For tmux, i'm using theses plugins:

**Plugin manager:**

- [tmux-tpm](https://github.com/tmux-plugins/tpm)

**Colorscheme:**

- [tmux-rose-pine](https://github.com/rose-pine/tmux)

**Utility:**

- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)

**Status bar:**

- [tmux-mode-indicator](https://github.com/MunifTanjim/tmux-mode-indicator)
- [tmux-ping](https://github.com/ayzenquwe/tmux-ping)
- [tmux-online-status](https://github.com/tmux-plugins/tmux-online-status)
- [tmux-weather](https://github.com/aaronpowell/tmux-weather)

### **Relevant files:**

- [.tmux.conf](https://github.com/kdzro/dev-environment/blob/main/.tmux.conf)

## Neovim setup

For my neovim setup, i'm using [lazy.nvim](https://github.com/folke/lazy.nvim) as plugin manager.

To use the configuration without problems, you should have these installed in your computer.

### **Dependencies:**

- [python](https://www.python.org/)
- python-venv
- [git](https://git-scm.com/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- unzip
- [lazygit](https://github.com/jesseduffield/lazygit)
- [debugpy](https://github.com/microsoft/debugpy)
- [pytest](https://github.com/pytest-dev/pytest)

Regarding neovim, i have the following plugins installed:

### **Plugins**

- [lazy.nvim](https://github.com/folke/lazy.nvim) as plugin manager
- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [auto-session](https://github.com/rmagatti/auto-session)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [avante.nvim](https://github.com/yetone/avante.nvim)
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [img-clip.nvim](https://github.com/hakonharnes/img-clip.nvim)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [rose-pine.nvim](https://github.com/rose-pine/neovim) to set a colorscheme
- [dressing.nvim](https://github.com/stevearc/dressing.nvim)
- [flash.nvim](https://github.com/folke/flash.nvim)
- [conform.nvim](https://github.com/stevearc/conform.nvim) for formatting
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [plenary](https://github.com/nvim-lua/plenary.nvim)
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [lazygit.nvim](https://github.com/jesseduffield/lazygit)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [neotest](https://github.com/nvim-neotest/neotest)
- [neotest-python](https://github.com/nvim-neotest/neotest-python)
- [nvim-nio](https://github.com/nvim-neotest/nvim-nio)
- [noice.nvim](https://github.com/folke/noice.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) for autocompletion
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [luasnip](https://github.com/L3MON4D3/LuaSnip)
- [cmp-luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [lspkind.nvim](https://github.com/onsails/lspkind.nvim)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) for debugging
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python)
- [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) for file explorer
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [substitute.nvim](https://github.com/gbprod/substitute.nvim)
- [nvim-surround](https://github.com/kylechui/nvim-surround)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for better highlighting
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [vim-maximizer](https://github.com/szw/vim-maximizer)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations)
- [neodev-nvim](https://github.com/folke/neodev.nvim)
- [mason](https://github.com/mason-org/mason.nvim)
- [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim)
- [mason_tool_installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)

## My entire setup is geared towards python development, you can change the entire configuration according to your needs.

### **Relevant files:**

Here is my neovim config folder:

- [.config](https://github.com/kdzro/dev-environment/tree/main/.config)
