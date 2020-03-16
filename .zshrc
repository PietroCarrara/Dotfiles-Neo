# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory beep extendedglob
# bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/pietro/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Prompt
PROMPT='%(?.%F{magenta}.%F{red})λ%f '
RPROMPT='%B%F{cyan}%~%f%b'

export EDITOR="nvim"
export GOPATH="$HOME/go"

export PATH="$PATH:$HOME/.local/bin:$HOME/.dotnet/tools:$HOME/.cargo/bin:$GOPATH/bin:$HOME/.scripts/util:$HOME/.scripts/images/:$HOME/.scripts/colors"

# Ctrl + arrows
bindkey ";5D" backward-word
bindkey ";5C" forward-word

function npx() {
    "./node_modules/.bin/$1" "${@:2}"
}

function mkcd() {
  mkdir -p "$1"
  cd "$1"  
}

function open() {
	xdg-open "$1" 2> /dev/null
}

alias flutter='flutter-exec'
alias grep='grep --color=auto'
alias v='nvim'
alias q=exit
alias cd..='cd ..'
alias ls='ls --color=auto'
alias lime='haxelib run lime'
alias hxpunk='haxelib run HaxePunk'
alias flixel='haxelib run flixel-tools'
alias crystal="dotnet $HOME/Projects/Crystal.Engine/Crystal.Engine/bin/Debug/netcoreapp3.0/Crystal.Engine.dll"
alias gocd="mkcd $GOPATH/src/github.com/PietroCarrara"
