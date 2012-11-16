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
export PATH=/data/work/src/android-ndk-r8:/data/work/src/android-sdk-macosx/tools:/data/work/src/android-sdk-macosx/platform-tools:/opt/local/bin:/opt/local/sbin:~/Downloads/Dropbox/bin:~/bin:~/local/bin:~/local/gnu_coreutils/bin:/usr/local/bin:$PATH

# aliases
alias ss='screen -D -RR'
alias ll='ls -l --color'
alias ttt="ctags -R . && cscope -R -b "
alias src="cd /data/work/src"
alias fr="cd /data/work/ares/frontend"
alias sc="cd /data/work/ares/frontend/svn/Resources/script"
alias ares="cd /data/work/ares/"
alias bb="cd /data/work/ares/apps/master"
alias vms="cd /data/work/ares/vms/"
alias dp="cd /data/work/ares/deploy/"
alias and="cd /data/work/ares/frontend/ares_core/android"
alias 26up="ssh hotel@122.11.61.26 'cd /home/hotel/ares/apps/master && git pull origin master'"
alias 50up="ssh hotel@192.168.1.50 'cd /home/hotel/ares/apps/master && git pull origin master'"
alias wiki="cd /data/work/wiki/wiki/"
alias wiki2="cd /data/work/src/wiki/wiki/"
export ANDROID_HOME=/data/work/src/android-sdk-macosx

if test -f "~/.git-completion.bash";then
    source ~/.git-completion.bash
fi
alias t='tunnel'

export EDITOR=/usr/local/bin/vim

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
LD_LIBRARY_PATH=/opt/local/lib
