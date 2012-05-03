if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export WORKON_HOME=~/.virtualenvs
export PIP_DOWNLOAD_CACHE=~/.pip-cache
export PS1='[\u $(__git_ps1 "(\033[34m%s\033[0m) ")\W]$ '
export PATH=$PATH:~/bin:/usr/sbin:/sbin:~/.rbenv/bin
export EDITOR=vim
export PIP_DOWNLOAD_CACHE=~/.pip-cache

VEW=`which virtualenvwrapper.sh`
if [ -f "$VEW" ]; then
    . $VEW
fi

. /etc/bash_completion.d/git
. /etc/bash_completion.d/subversion

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
