# pedantic gcc
alias pcc="gcc -Wall -Wextra -pedantic-errors -ansi"

# debian quilt
alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"

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
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# No way I'm gonna remember this
alias git-serve='git instaweb'

# Show next two months in cal's output by default
alias cal='cal -A2'
alias rxvt_white='rxvt -bg white -fg black'

alias zssh='ssh -p 2323 -i ~/.ssh/id_rsa_zenmate'
alias zscp='scp -P 2323 -i ~/.ssh/id_rsa_zenmate'
