# Source global definitions
if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi

eval `ssh-agent -s`
# User specific aliases and functions
export JAVA_HOME=/usr/java/latest
export PATH=$JAVA_HOME/bin:$PATH
function parse_git_branch {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}")"
}

PS1="\w \$(parse_git_branch)\$:"
alias ls='ls -l'
alias lf="ls -l | egrep -v '^d'"
alias ldir="ls -l | egrep '^d'"
