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
    export PS1="\e[0;33m\u@\h:\w (${SCREEEN_PS1} \$(parse_git_branch)) > \e[m\n> "
    ;;
*)
    export PS1="\e[0;36m\u@\h:\w (\$(parse_git_branch)) > \e[m\n> "
    #export PS1="\u@\h:\w\n> "
    ;;
esac

umask 002
#export GREP_OPTIONS="-ir"
export PATH=/data/work/src/android-sdks/platform-tools:/opt/local/bin:/opt/local/sbin:~/Downloads/Dropbox/bin:~/bin:~/local/bin:~/local/gnu_coreutils/bin:/usr/local/bin:$PATH

# aliases
alias s='screen -D -RR'
alias ll='ls -l --color'
alias ttt="ctags -R . && cscope -R -b "
alias src="cd /data/work/src"
alias fr="cd /data/work/ares/frontend"
alias sc="cd /data/work/ares/frontend/svn/Resources/script"
alias ares="cd /data/work/ares/"

source ~/.git-completion.bash
alias t='tunnel'

export EDITOR=/usr/local/bin/vim

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
