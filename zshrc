# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
DISABLE_CORRECTION="true"
export UPDATE_ZSH_DAYS=120
COMPLETION_WAITING_DOTS="true"
plugins=(osx git git-extras github nvm redis-cli rbenv rake-fast heroku gulp github)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/npm/bin

eval "$(rbenv init -)"

alias b='bundle exec'
alias fs='foreman start'

export ANDROID_HOME=/usr/local/Cellar/android-sdk/22.0.5

export EDITOR=vim
export PGDATA=/usr/local/var/postgres
export NODE_PATH="/usr/local/lib/node"
export CC=/usr/bin/gcc
