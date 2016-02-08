if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export WORKON_HOME=~/.virtualenvs
export PIP_DOWNLOAD_CACHE=~/.pip-cache
#export PS1='[\u $(__git_ps1 "(\033[34m%s\033[0m) ")\W]$ '
export PS1='[\@] \[\033[1;32m\]\u@$(hostname -s)\[\033[1;36m\] \w\[\033[00m\] \[\033[0;33m\]$(__git_ps1 "(%s)")\[\033[00m\]\n$ '
export PATH=$PATH:~/bin:/usr/sbin:/sbin:~/.rbenv/bin
export EDITOR=vim
export PIP_DOWNLOAD_CACHE=~/.pip-cache
export HISTCONTROL=ignoreboth:erasedups

VEW=`which virtualenvwrapper.sh`
if [ -f "$VEW" ]; then
    . $VEW
fi

source /usr/local/opt/git/etc/bash_completion.d/git-completion.bash
source /usr/local/opt/git/etc/bash_completion.d/git-prompt.sh

if [ -d ~/.nvm -a $? -eq 0 ]; then
    export NVM_DIR=~/.nvm
    . $(brew --prefix nvm)/nvm.sh
fi

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

if [ -f ~/.aliasrc ]; then
    . ~/.aliasrc
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

# Load rbenv automatically by appending
# the following to ~/.bash_profile:

export RBENV_VERSION=2.3.0

eval "$(rbenv init -)"

ulimit -n 4096
