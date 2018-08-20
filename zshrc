# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
export UPDATE_ZSH_DAYS=120
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
plugins=(osx git git-extras github nvm redis-cli rbenv rake-fast heroku gulp github)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/npm/bin

export ANDROID_HOME=/usr/local/Cellar/android-sdk/22.0.5
export EDITOR=vim
export PGDATA=/usr/local/var/postgres
export NODE_PATH="/usr/local/lib/node"
export CC=/usr/bin/gcc
export LIBCURL_CFLAGS=-I/usr/local/opt/curl/include
export LIBCURL_LIBS=-L/usr/local/opt/curl/lib

alias b='bundle exec'
alias fs='foreman start'
alias dc='docker-compose'
alias gh='github .'
alias gpr='git pull --rebase'
alias gpf='git push --force-with-lease'

alias zshrc='vim ~/.zshrc'
alias vimrc='source ~/.vimrc.before && source ~/.vimrc.after'
alias vimrcafter='vim ~/.vimrc.after'

eval "$(rbenv init -)"

function kil() {
  ps aux | grep -ie $1 | awk '{print $2}' | xargs kill -9
}

# docker

dkill(){
  echo "Killing all docker containers..."
  docker kill $(docker ps --quiet)
}

dstop(){
  echo "Stopping all docker containers..."
  docker stop $(docker ps --all --quiet)
}

drm(){
  echo "Removing all stopped containers..."
  docker rm $(docker ps --all --quiet --filter status=exited)
  docker rm $(docker ps --all --quiet --filter status=created)
}

drmi(){
  echo "Removing all untagged images:"
  docker rmi $(docker images --quiet --filter dangling=true)
}

dclean() {
  echo "Removing stopped containers and removing untagged images..."
  docker rm $(docker ps --all --quiet --filter status=created)
  docker rm $(docker ps --all --quiet --filter status=exited)
  docker rmi $(docker images --quiet --filter dangling=true)
}

dmu() {
  eval "$(docker-machine env $1)"
}

dms() {
  eval "$(docker-machine env --swarm $1)"
}

debug_ci() {
  local project=$1
  local image="registry.nexiabuild.com/$project-ci"

  docker run -ti --rm --env ID_RSA_KEY="$(cat ~/.ssh/id_rsa)" $image bash
}

