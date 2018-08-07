if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

BREW_PREFIX=$(brew --prefix)
BASH_COMPLETION=$BREW_PREFIX/etc/bash_completion
# shellcheck source=/dev/null
if [ -f "$BASH_COMPLETION" ]; then
  . "$BASH_COMPLETION"
fi

export GIT_PS1_SHOWDIRTYSTATE=yes
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWSTASHSTATE=yes

source "$BREW_PREFIX/etc/bash_completion.d/git-completion.bash"
source "$BREW_PREFIX/etc/bash_completion.d/git-prompt.sh"

export WORKON_HOME=~/.virtualenvs
export PIP_DOWNLOAD_CACHE=~/.pip-cache
export PS1='[\@] \[\033[1;32m\]\u@$(hostname -s)\[\033[1;36m\] \w\[\033[00m\] \[\033[0;33m\]$(__git_ps1 "(%s)")\[\033[00m\]\n$ '
export PATH=/usr/local/nsolid/bin:~/bin:/usr/sbin:/sbin:/usr/local/bin:~/.rbenv/bin:$PATH
export EDITOR=vim
export HISTCONTROL=ignoreboth

if [ -f ~/.aliasrc ]; then
    source ~/.aliasrc
fi

if [ "$PS1" ]; then
    case $TERM in
    xterm*)
        PROMPT_COMMAND='printf "\033]0;(%s) %s\007" "${USER}" "${PWD/#$HOME/~}"'
        ;;
    screen)
        PROMPT_COMMAND='printf "\033]0;(%s) %s\033\\" "${USER}" "${PWD/#$HOME/~}"'
        ;;
    esac
fi

# Stop that.
unset command_not_found_handle
eval "$(direnv hook bash)"

# # Load rbenv automatically by appending
# # the following to ~/.bash_profile:
# 
# export RBENV_VERSION=2.3.0
# 
# eval "$(rbenv init -)"

ulimit -n 4096

VEW=$(which virtualenvwrapper.sh)
if [ ! -z "$VEW" ]; then
    source "$VEW"
fi

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

export VAULT_ADDR=https://prod.vault.conde.io:443
export GOPATH=~/code/go

GPG_TTY=$(tty)
export GPG_TTY

export NVM_DIR="$HOME/.nvm"
if [ -f "$BREW_PREFIX/opt/nvm/nvm.sh" ]; then
    source "$BREW_PREFIX/opt/nvm/nvm.sh"
fi
