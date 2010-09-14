if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export WORKON_HOME=~/.virtualenvs
export PIP_DOWNLOAD_CACHE=~/.pip-cache
export PS1='[\u $(__git_ps1 "(\033[34m%s\033[0m) ")\W]$ '
export PATH=$PATH:~/bin:/usr/sbin:/sbin
export EDITOR=vim
export PIP_DOWNLOAD_CACHE=~/.pip-cache

. ~/.virtualenvwrapper

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

alias check='check.py'
alias df='df -h'
alias diff='diff -u'
alias django='python manage.py'
alias edconf='sudo vim /etc/httpd/conf/httpd.conf'
alias l.='ls -d .* --color=auto'
alias lh='ls -lh --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias mkvirtualenv='mkvirtualenv --no-site-packages'
alias phpunit='phpunit --colors'
alias su='sudo su'
alias t='python manage.py test -s --logging-clear-handlers --noinput'
alias vi='vim'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias schematic='python ./vendor/src/schematic/schematic'
