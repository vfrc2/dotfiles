source $HOME/.shellenv

eval "$(starship init bash)"

if [ -f $HOME/.shellalias ]; then
    source $HOME/.shellalias
fi

if [ -f $HOME/.config/scripts/bash_tmux.sh ]; then
    source $HOME/.config/scripts/bash_tmux.sh
fi
