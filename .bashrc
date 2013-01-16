# Source global definitions
if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi

# User specific aliases and functions
export JAVA_HOME=/usr/java/latest
export PATH=$JAVA_HOME/bin:$PATH

alias ls='ls -al'
alias lf="ls -al | egrep -v '^d'"
alias ldir="ls -al | egrep '^d'"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='\n\u:\w$(parse_git_branch)\$'
