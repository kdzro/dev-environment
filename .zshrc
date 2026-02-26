if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting tmux)


source $ZSH/oh-my-zsh.sh

alias ls="eza --icons"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
