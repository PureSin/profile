# Source global definitions
if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi

eval `ssh-agent -s`
# User specific aliases and functions
export JAVA_HOME=/usr/java/latest
export PATH=$JAVA_HOME/bin:$PATH

alias ls='ls -l'
alias lf="ls -l | egrep -v '^d'"
alias ldir="ls -l | egrep '^d'"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/-(\1)/'
}

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
color_prompt=yes
else
color_prompt=
fi
fi

PS1='\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
unset color_prompt force_color_prompt
