<h1 align="center">
    Personal dev configuration
</h1>

| nvim                                                                                                            | terminal                                                                                                        |
| --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| <center><img src = "https://github.com/user-attachments/assets/a4026d54-fe63-4560-bdfc-e492c2cf9c09"/></center> | <center><img src = "https://github.com/user-attachments/assets/3584c996-930a-48b3-8dd6-bcc5e6e613b0"/></center> |

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

About the font, i'm currently using **JetBrainsMono** from Nerd Font.

### **Relevant files:**

- [wezterm.lua](https://github.com/kdzro/dev-environment/blob/main/wezterm.lua)
- [.zshrc](https://github.com/kdzro/dev-environment/blob/main/.zshrc)

## Tmux setup

For tmux, i'm using theses plugins:

**Plugin manager:**

- [tmux-tpm](https://github.com/tmux-plugins/tpm)

**Colorscheme:**

- [catppuccin](https://github.com/catppuccin/tmux)

**Utility:**

- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)

**Status bar:**

- [tmux-cpu](https://github.com/tmux-plugins/tmux-cpu)
- [tmux-weather](https://github.com/ilya-manin/tmux-weather)
- [gitmux](https://github.com/arl/gitmux)

### **Relevant files:**

- [.tmux.conf](https://github.com/kdzro/dev-environment/blob/main/.tmux.conf)
- [.gitmux.conf](https://github.com/kdzro/dev-environment/blob/main/.gitmux.conf))

## Neovim setup

For my neovim setup, i'm using [lazy.nvim](https://github.com/folke/lazy.nvim) as plugin manager.

To use the configuration without problems, you should have these installed in your computer.

### **Dependencies:**

- [python](https://www.python.org/)
- python-venv
- [debugpy](https://github.com/microsoft/debugpy)
- [pytest](https://github.com/pytest-dev/pytest)
- npm
- unzip
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [git](https://git-scm.com/)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [java](https://www.oracle.com/br/java/technologies/downloads/)
- [clangd](https://github.com/clangd/clangd)
- [dotnet](https://learn.microsoft.com/pt-br/dotnet/core/install/linux-ubuntu-install?tabs=dotnet9&pivots=os-linux-ubuntu-2404)

Regarding neovim, i have the following plugins installed:

### **Plugins**

I'm using **lazy.nvim** as my plugin manager.

[lazy.nvim](https://github.com/folke/lazy.nvim)

**My plugins list:**

**Dependencies for other plugins:**

- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [nvim-nio](https://github.com/nvim-neotest/nvim-nio)
- [volt](https://github.com/nvzone/volt)

**Colorscheme:**

- [catppuccin](https://github.com/catppuccin/nvim)

**Icons:**

- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

**LSP:**

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim)
- [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)

**Mason:**

- [mason.nvim](https://github.com/mason-org/mason.nvim)
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)

**Greeter:**

- [alpha-nvim](https://github.com/goolord/alpha-nvim)

**Auto-session:**

- [auto-session](https://github.com/rmagatti/auto-session)

**AI plugin:**

- [avante.nvim](https://github.com/yetone/avante.nvim)

**Breadcrumbs and navigation:**

- [barbecue.nvim](https://github.com/utilyre/barbecue.nvim)
- [nvim-navbuddy](https://github.com/SmiteshP/nvim-navbuddy)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [flash.nvim](https://github.com/folke/flash.nvim)

**Navigating between neovim and tmux:**

- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

**Bufferline:**

- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

**Terminal manager:**

- [floaterm](https://github.com/nvzone/floaterm)

**Formatting:**

- [conform.nvim](https://github.com/stevearc/conform.nvim)

**Git:**

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

**Indentation guides:**

- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

**Status line:**

- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

**Testing:**

- [neotest](https://github.com/nvim-neotest/neotest)
- [neotest-python](https://github.com/nvim-neotest/neotest-python)
- [neotest-java](https://github.com/rcasia/neotest-java)
- [neotest-gtest](https://github.com/alfaix/neotest-gtest)

**Better UI and notifications:**

- [dressing.nvim](https://github.com/stevearc/dressing.nvim)
- [noice.nvim](https://github.com/folke/noice.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)

**Snippets:**

- [luasnip](https://github.com/L3MON4D3/LuaSnip)
- [cmp_luanisp](https://github.com/saadparwaiz1/cmp_luasnip)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

**Autocompletion:**

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [lspkind.nvim](https://github.com/onsails/lspkind.nvim)

**Debugger:**

- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python)
- [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
- [one-small-step-for-vimkind](https://github.com/jbyuki/one-small-step-for-vimkind)

**File explorer:**

- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

**Essentials:**

- [substitute.nvim](https://github.com/gbprod/substitute.nvim)
- [nvim-surround](https://github.com/kylechui/nvim-surround)

**Fuzzy finder:**

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)

**Comments:**

- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

**Syntax highlighting and autoclosing:**

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)

**Trouble:**

- [trouble.nvim](https://github.com/folke/trouble.nvim)

**Maximize neovim window/split:**

- [vim-maximizer](https://github.com/szw/vim-maximizer)

**Keymap suggestions:**

- [which-key.nvim](https://github.com/folke/which-key.nvim)

**Images:**

- [img-clip.nvim](https://github.com/hakonharnes/img-clip.nvim)

## My entire setup is geared towards python, java, c++ and c# development, you can change the entire configuration according to your needs.

### **Relevant files:**

Here is my neovim config folder:

- [.config](https://github.com/kdzro/dev-environment/tree/main/.config)
