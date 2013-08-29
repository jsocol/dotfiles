if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export WORKON_HOME=~/.virtualenvs
export PIP_DOWNLOAD_CACHE=~/.pip-cache
#export PS1='[\u $(__git_ps1 "(\033[34m%s\033[0m) ")\W]$ '
export PS1='[\@] \[\033[1;32m\]\u\[\033[1;36m\] \w\[\033[00m\] \[\033[0;33m\]$(__git_ps1 "(%s)")\[\033[00m\]\n$ '
export PATH=$PATH:~/bin:/usr/sbin:/sbin:~/.rbenv/bin
export EDITOR=vim
export PIP_DOWNLOAD_CACHE=~/.pip-cache

VEW=`which virtualenvwrapper.sh`
if [ -f "$VEW" ]; then
    . $VEW
fi

if [ -f /etc/bash_completion.d/git ]; then
    . /etc/bash_completion.d/git
fi
if [ -f /etc/bash_completion.d/subversion ]; then
    . /etc/bash_completion.d/subversion
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
