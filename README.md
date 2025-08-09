# DEV ENVIRONMENT FILES

Aqui está minha configuração do ambiente de desenvolvimento voltado para python.
Segue o que é necessário para utilização da configuração.

# TERMINAL SETUP

O terminal que estou usando é o [Wezterm](https://wezterm.org/install/windows.html).
Para customizar o terminal, é necessário criar dentro de C:\Usuários\nome_usuário\.config\wezterm o arquivo de configuração do wezterm.

Links importantes para o bom funcionamento da customização:

**Necessário:**

- [WSL2](https://learn.microsoft.com/pt-br/windows/wsl/install)
- [MesloLGS Nerd Font](https://github.com/ryanoasis/nerd-fonts)
- [ZSH](https://github.com/ohmyzsh/ohmyzsh)

_OBS: Na minha configuração está instalado a distro do Ubuntu no WSL2, caso utilize outra, mudar na configuração._

# ZSH CONFIGURATION

Arquivo de configuração do zsh: [.zshrc]()

Para minha configuração do zsh, estou usando o tema [powerlevel10k](https://github.com/romkatv/powerlevel10k) e os seguintes plugins:

**Plugins:**

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting.git)
- web-search

Caso não saiba mexer no zsh, olhar em [zsh](https://github.com/ohmyzsh/ohmyzsh)

# TMUX CONFIGURATION

Arquivo de configuração tmux: [.tmux.conf]

Clone o [tpm](https://github.com/tmux-plugins/tpm) e instale os plugins, caso não saiba como mexer no tmux, olhar em [tmux](https://github.com/tmux/tmux).

# NEOVIM CONFIGURATION

Diretório com a configuração do neovim: [config-neovim]()

Para instalar o neovim, olhe em [neovim](https://github.com/neovim/neovim). Após a instalação, coloque o diretório _.config_ dentro de home.
Ao abrir o neovim, a instalação dos plugins irá iniciar. Segue algumas dependências necessárias para o bom funcionamento de toda configuração/plugins.

**Pendências:**

- [Python](https://www.python.org/)
- [npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
- [python-venv](https://docs.python.org/pt-br/3.13/library/venv.html)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- unzip (linux package)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [debugpy](https://github.com/microsoft/debugpy)

# Finalizando

Aqui está uma mini explicação sobre meu ambiente de desenvolvimento, caso queira utilizá-lo. Essa explicação não é um tutorial detalhado sobre como utilizar
as tecnologias aqui ditas, é importante entender que é necessário ter um conhecimento prévio sobre como utilizá-las.
