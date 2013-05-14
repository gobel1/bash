# ~/.bashrc: executed by bash(0) for non-login shells.

# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return 0;

export PATH=/sbin:/usr/sbin:$PATH;
export EDITOR=vi
export PAGER=most

#Gestion de l'historique
CYAN=$(echo -e '\e[0;36m')
NORMAL=$(echo -e '\e[0m')

export HISTCONTROL=ignoredups; #Pas de doublons
#export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="${CYAN}[ %d/%m/%Y %H:%M:%S ]${NORMAL} "
#export HISTTIMEFORMAT='%Y.%m.%d-%T :: ' 
export HISTFILESIZE=50000 
export HISTSIZE=50000
##Safe History
PROMPT_COMMAND="history -a";

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize;

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)";

# Enable color support of ls
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`";
fi

# Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot);
fi

# Set color 
#if [ "`id -u`" -eq 0 ];then prompt_color='\[\033[01;31m\]';else prompt_color='\[\033[01;32m\]';fi

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-color)
	    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32m\]\$|'$prompt_color'\u\[\033[00;32m\]@\[\033[01;32m\]\h\[\033[00;32m\]:\[\033[01;32m\]\t\[\033[00;32m\]>>\[\033[00m\] ';
	;;
	*)
	    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ ';
	;;
esac

# Comment in the above and uncomment this below for a color prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32m\]\$|'$prompt_color'\u\[\033[00;32m\]@\[\033[01;32m\]\h\[\033[00;32m\]:\[\033[01;32m\]\t\[\033[00;32m\]>>\[\033[00m\] ';

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
	;;
	*)
		#Do nothing;
	;;
esac

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases;
fi

# Function definitions.
if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions;
fi

# Enable programmable completion features 
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion;
fi

## cd $myVar
shopt -s cdable_vars;

## Correction sur les noms des répertoires avec cd
shopt -s cdspell; 

##Retourne les valeur de retours si non nul 
export PROMPT_COMMAND='( x=$? ; let x!=0 && echo "sHell returned : $x" )';

#Greating
echo -e "Hello `whoami` !\tWe're in `date '+%Y:%m:%d'`\nI am Locutus of Borg. Resistance is futile.\nYour life as it has been is over. From this time forward, you will service us."
who

#VGL
#VGL_DISPLAY=:8
#export VGL_DISPLAY
#VGL_COMPRESS=yuv
#export VGL_COMPRESS
#VGL_READBACK=fbo
#export VGL_READBACK
