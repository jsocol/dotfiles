if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export WORKON_HOME=~/.virtualenvs
export PIP_DOWNLOAD_CACHE=~/.pip-cache
export PS1='[\u $(__git_ps1 "(\033[34m%s\033[0m) ")\W]$ '
export PATH=$PATH:~/bin:/usr/sbin:/sbin:~/.rbenv/bin
export EDITOR=vim
export PIP_DOWNLOAD_CACHE=~/.pip-cache

if [ -f ~/.virtualenvwrapper ]; then
    . ~/.virtualenvwrapper
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
