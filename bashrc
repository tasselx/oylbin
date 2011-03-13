# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias 50pull='ssh hotel@h50 "cd /home/hotel/work/zeus/current && git pull && cd /home/hotel/work/zeusconfig/ && git pull"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export GREP_OPTIONS="-ir"

export PATH=~/bin:~/local/bin:~/local/src/redis/src:$PATH
export LANGUAGE='en_US:en'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/Branch:\1/'
}

case "$TERM" in
xterm-256color|screen-256color)
    SCREEEN_PS1="Window:$WINDOW"
    export PS1="\e[0;33m\u@\h:\w (${SCREEEN_PS1} \$(parse_git_branch)) > \e[m\n> "
    ;;
*)
    export PS1="\u@\h:\w\n> "
    ;;
esac
PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME} \007"'
HOSTNAME=`hostname`
case "$HOSTNAME" in 
oylbin-laptop)
    alias screen='screen -T screen-256color'
    #xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
    ;;
*)
    alias screen='screen -T xterm-256color'
    alias s='screen -T xterm-256color'
    ;;
esac
umask 002

export PKG_CONFIG_PATH=$HOME/local/lib/pkgconfig
export LD_LIBRARY_PATH=$HOME/local/lib
