# Path to your oh-my-zsh installation.
export ZSH=/Users/iso/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

plugins=(git)

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

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"

source $ZSH/oh-my-zsh.sh

alias code="~/code"
alias doc="~/Documents"
alias dk=docker
alias dc=docker-compose
alias kbl=kubectl

# Initialize colors.
autoload -U colors
colors
 
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

PROMPT=$'%{${fg[white]}%}$(get_pwd)%b$(prompt_git_info)%{${fg[default]}%} '
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
