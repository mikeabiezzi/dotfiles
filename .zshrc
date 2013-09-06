# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
export UPDATE_ZSH_DAYS=30
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(osx)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

eval "$(rbenv init -)"

alias b='bundle exec'
