if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
ZSH_THEME="spaceship"
setopt autocd notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mohammed/.zshrc'

autoload -Uz compinit
compinit


# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

# End of lines added by compinstall
neofetch

# sourcing .zprofile because it doesn't for some reason
source $HOME/.zprofile

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#source "$HOME/.plugins/spaceship/spaceship.zsh"



# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable file and folder highlighting when using tab completion
#
export LS_COLORS="di=1;34:$LS_COLORS"

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"




alias dragon="dragon-drag-and-drop"
alias psqli="./psqli" 
alias r="radian"
alias rstudio="sudo rstudio-bin"
source ~/powerlevel10k/powerlevel10k.zsh-theme
# Set up Node Version Manager
# source /usr/share/nvm/init-nvm.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mohamed/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mohamed/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mohamed/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mohamed/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# alternative apps
alias sudo='doas'
alias ls='exa'
alias cat='bat'
alias lcat='cat'
alias grep='rg'
alias find='fd'
alias i='doas pacman -Sy '
alias cc='g++ main.cpp -o main && ./main'
alias ds='du -sh -- * | sort -h'
alias npm='pnpm'
alias npx='pnpx'
alias flameshot='flameshot gui'
alias cl='clear'
alias nrd="cl && npm run dev"
alias pgdc="docker run -e POSTGRES_PASSWORD=69420 --name=pg --rm -d -p 5432:5432 postgres:14-alpine"
export PATH="$PATH:/usr/flutter/bin:$HOME/.local/bin:$HOME/bin" 

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.local/share/JetBrains/Tooolbox/scripts:$PATH"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk/"
export PATH="$JAVA_HOME/bin:/opt/android_sdk/cmdline-tools/latest/bin:$PATH"
export ANDROID_HOME="$HOME/android_sdk"
export ANDROID_SDK_ROOT=$ANDROID_HOME

# load plugins
source ~/.plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
for FILE in ~/.plugins/*.zsh; do source $FILE; done

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# pnpm
export PNPM_HOME="/home/mohamed/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# bun completions
[ -s "/home/mohamed/.bun/_bun" ] && source "/home/mohamed/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
