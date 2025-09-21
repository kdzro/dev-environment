<h1 align="center">
    Personal dev configuration
</h1>

| nvim                                                                                                            | terminal                                                                                                        |
| --------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| <center><img src = "https://github.com/user-attachments/assets/795ab427-8699-493a-b17a-a99917ea2f44"/></center> | <center><img src = "https://github.com/user-attachments/assets/ebb0ffb3-74ef-4dde-8132-78507fc55fca"/></center> |

<div align="center">

![Static Bagde](https://img.shields.io/badge/Neovim-kdzro-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white)

</div>

## What i'm using

- [WSL2](https://github.com/microsoft/WSL)
- [zsh](https://github.com/ohmyzsh/ohmyzsh)
- [tmux](https://github.com/tmux/tmux)
- [neovim](https://github.com/neovim/neovim)

## Terminal setup

For the terminal, i'm currently using [WezTerm](https://wezterm.org/index.html) along with zsh. You can configure the terminal in [wezterm.lua](https://github.com/kdzro/dev-environment/blob/main/wezterm.lua) file.

Install [Ohmyzsh](https://ohmyz.sh/):

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

I'm using [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme for zsh, to install it, run the following command:

```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

For zsh plugins, i'm currently using [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), to install them, run these:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

The font that i'm using is **[JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)**

### **Relevant files:**

- [wezterm.lua](https://github.com/kdzro/dev-environment/blob/main/wezterm.lua)
- [.zshrc](https://github.com/kdzro/dev-environment/blob/main/.zshrc)

## Tmux setup

For tmux, i'm using theses plugins:

**Plugin manager:**

- [tmux-tpm](https://github.com/tmux-plugins/tpm)

To install the plugin manager, run the following command in your terminal:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

**Colorscheme:**

- [tmux2k](https://github.com/2KAbhishek/tmux2k)

> The colorscheme is configured with Kanagawa's theme colors.

**Utility:**

- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)

### **Relevant files:**

- [.tmux.conf](https://github.com/kdzro/dev-environment/blob/main/.tmux.conf)

## Neovim setup

For my neovim setup, i'm using [lazy.nvim](https://github.com/folke/lazy.nvim) as plugin manager.

To use the configuration without problems, you should have these installed in your computer.

### **Dependencies:**

- [python](https://www.python.org/)
- python-venv
- [debugpy](https://github.com/microsoft/debugpy)
- npm
- unzip
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [git](https://git-scm.com/)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [lazydocker](https://github.com/jesseduffield/lazydocker)

Regarding neovim, i have the following plugins installed:

### **Plugins**

**Plugin Manager:**

[lazy.nvim](https://github.com/folke/lazy.nvim)

**My plugins list:**

**Dependencies for other plugins:**

- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [nvim-nio](https://github.com/nvim-neotest/nvim-nio)

**Colorscheme:**

- [kanagawa](https://github.com/rebelot/kanagawa.nvim)

**Icons:**

- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

**LSP:**

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [lazydev]()
- [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim)

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
- [aerial.nvim](https://github.com/stevearc/aerial.nvim)
- [overlook.nvim](https://github.com/WilliamHsieh/overlook.nvim)

**Navigating between neovim and tmux:**

- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

**Bufferline:**

- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

**Formatting:**

- [conform.nvim](https://github.com/stevearc/conform.nvim)

**Git:**

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

**Docker:**

- [lazydocker.nvim](https://github.com/crnvl96/lazydocker.nvim)

**Indentation guides:**

- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

**Status line:**

- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

**Better UI, animations and notifications:**

- [dressing.nvim](https://github.com/stevearc/dressing.nvim)
- [noice.nvim](https://github.com/folke/noice.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [tiny-glimmer.nvim](https://github.com/rachartier/tiny-glimmer.nvim)

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

**File explorer:**

- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

**Essentials:**

- [vim-visual-multi](https://github.com/mg979/vim-visual-multi)
- [nvim-surround](https://github.com/kylechui/nvim-surround)

**Fuzzy finder:**

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim)

**Comments:**

- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

**Syntax highlighting and autoclosing:**

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)

**Trouble:**

- [trouble.nvim](https://github.com/folke/trouble.nvim)

**Keymap suggestions:**

- [which-key.nvim](https://github.com/folke/which-key.nvim)

**Images:**

- [img-clip.nvim](https://github.com/hakonharnes/img-clip.nvim)

**Focus plugins:**

- [twilight.nvim](https://github.com/folke/twilight.nvim)

**Cursor:**

- [smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim)

**Markdown:**

- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)
- [live-preview.nvim](https://github.com/brianhuster/live-preview.nvim)

### **Relevant files:**

Here is my neovim config folder:

- [.config](https://github.com/kdzro/dev-environment/tree/main/.config)

## My entire setup is geared towards python development, you can change the entire configuration according to your needs.
