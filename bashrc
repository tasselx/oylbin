export LANGUAGE='en_US:en'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


up() {
    local level
    if test "$#" = "0";then
       level=1
    else
       level=$1
    fi
    local path=""
    for ((i=1;i<=level;i++)); do
        path="../$path"
    done
    cd $path
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/Branch:\1/'
}

case "$TERM" in
xterm-256color|screen-256color)
    SCREEEN_PS1="Window:$WINDOW"
    export PS1="\e[0;32m\u@\h:\w (${SCREEEN_PS1} \$(parse_git_branch)) > \e[m\n> "
    ;;
*)
    export PS1="\e[0;31m\u@\h:\w (\$(parse_git_branch)) > \e[m\n> "
    #export PS1="\u@\h:\w\n> "
    ;;
esac

umask 002
#export GREP_OPTIONS="-ir"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/share/python:/usr/local/sbin:/data/work/src/android-ndk-r8:/data/work/src/android-sdk-macosx/tools:/data/work/src/android-sdk-macosx/platform-tools:~/bin:~/local/bin:/usr/local/bin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# aliases
alias ss='screen -D -RR'
alias ll='ls -lh'
alias src="cd /data/work/src"
alias fr="cd /data/work/src/ares"
alias sc="cd /data/work/src/ares/svn/Resources/script"
alias bb="cd /data/work/ares/apps/master"
alias vms="cd /data/work/ares/vms/"
alias dp="cd /data/work/ares/deploy/"
alias and="cd /data/work/src/ares/ares_core/android"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

alias wiki="cd /data/work/wiki/wiki/"
export ANDROID_HOME=/data/work/src/android-sdk-macosx

if test -f "~/.git-completion.bash";then
    source ~/.git-completion.bash
fi
alias t='tunnel'

export EDITOR=vim

export HISTSIZE=1000000
export HISTFILESIZE=1000000
shopt -s histappend

