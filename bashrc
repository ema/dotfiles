# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|screen*|rxvt*) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

PROMPT_COMMAND='prompt_status="$? "; jobs=" (`jobs | wc -l`)" ;if [[ $prompt_status == "0 " ]]; then prompt_status=; fi; if [[ $jobs == " (0)" ]]; then jobs=; fi'

if [ "$color_prompt" = yes ]; then
    PS1='$prompt_status${debian_chroot:+($debian_chroot)}\u@\h:\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]$jobs\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|screen*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# added by duckpan installer
#eval $(perl -I${HOME}/perl5/lib/perl5 -Mlocal::lib)

export GOPATH=$HOME/dev/go
export GEM_HOME=$HOME/gems
export PATH=$HOME/bin:$PATH:$GOPATH/bin:$GEM_HOME/bin
export EDITOR=/usr/bin/vim

export NAME="Emanuele Rocca"
export DEBEMAIL="${NAME} <ema@debian.org>"

APPENGINE_SDK="$HOME/dev/google_appengine"
export PYTHONPATH="$APPENGINE_SDK:."

# Set the From: field in nullmailer. See nullmailer-inject(1).
export NULLMAILER_HOST="linux.it"


# ssh key
keychain > /dev/null 2>&1
[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
. $HOME/.keychain/$HOSTNAME-sh 2>/dev/null
ssh-add -l 2>/dev/null | grep -q id_rsa || ssh-add

fortune
