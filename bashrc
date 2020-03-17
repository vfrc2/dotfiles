# Include aliases
if [[ -f ~/.bash_aliases ]]; then
  source ~/.bash_aliases
fi

# enable bash completion in interactive shells
if ! shopt -oq posix; then
 if [ -f /usr/share/bash-completion/bash_completion ]; then
   . /usr/share/bash-completion/bash_completion
 elif [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
 fi
fi

GIT_PS1_SHOWDIRTYSTATE=yes

if [ "$(type -t __git_ps1)" != 'function' ]; then    
    __git_ps1() { echo; }
fi

PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W$(__git_ps1 " (%s)") \$ '

# Include local bashrc
if [[ -f ~/.bashrc.local ]]; then
  source ~/.bashrc.local
fi