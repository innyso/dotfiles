# Path to your oh-my-zsh installation.
export ZSH=/Users/iso/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"

source $ZSH/oh-my-zsh.sh

alias code="~/code"
alias doc="~/Documents"

source $ZSH/zsh-git-prompt/zshrc.sh
#PROMPT='%B%m%~%b$(git_super_status) %# '
PROMPT='%B%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%}%{$fg_bold[green]%}%~%{$reset_color%}%b$(git_super_status) %# '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
