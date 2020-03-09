# Start tmux by default
# if [ "$TMUX" = "" ]; then tmux; fi

# Path to your oh-my-zsh installation.
export ZSH=/Users/iso/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

plugins=(
  git
  fzf
  kubectl
  tmux
)

# go-install <name of src to install>
go-install(){
  docker run --rm -v $PWD:/usr/src -w /usr/src -e GOPATH=/usr/src -e GOOS=darwin golang:latest go install -v $1
}

pull-ansible-subtree(){
  git subtree pull --prefix=$1/ansible --squash shared-ansible master
}

push-ansible-subtree(){
  git subtree push --prefix=$1/ansible shared-ansible master
}

set-dc-env(){
  eval $(docker-machine env $1)
}

with-time(){
  $1 |  ts '[%Y-%m-%d %H:%M:%S]'
}

find-big-dir(){
  du -a $1 | sort -n -r | head -n 10
}

# User configuration

export PATH="/usr/local/CrossPack-AVR/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
export AWS_CONFIG_FILE=$HOME/.aws/config
export HISTFILESIZE=10000

source $ZSH/oh-my-zsh.sh

alias code="~/code"
alias doc="~/Documents"

alias dm='docker-machine'
alias dc='docker-compose'
alias dk='docker'
alias k=kubectl
alias jsonnet='docker run --rm -it -v `pwd`:/src innyso/jsonnet jsonnet'
alias tf='terraform'
alias cleanme='du -h -d 1 | gsort -r -h'
alias outofspace='du -a $1 | sort -n -r | head -n 10'
# Initialize colors.
autoload -U colors
colors
 
bindkey -v

# Allow for functions in the prompt.
setopt PROMPT_SUBST
 
# Autoload zsh functions.
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)
 
# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
 
# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'

PROMPT=$'%{${fg[white]}%}%B%~%b$(prompt_git_info)%{${fg[default]}%} '
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
precmd() {
  RPROMPT=""
}
zle-keymap-select() {
  RPROMPT=""
  [[ $KEYMAP = vicmd ]] && RPROMPT="%{${fg[blue]}%}%B%\[CMD]%b"
  () { return $__prompt_status }
  zle reset-prompt
}
zle-line-init() {
  typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

ZSH_TMUX_AUTOSTART=true
