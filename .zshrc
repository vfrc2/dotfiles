export PATH=$PATH:$HOME/Library/Python/3.8/bin:/opt/local/bin

if [ -f "$HOME/.shellenv" ]; then
    source "$HOME/.shellenv"
fi

if [ -f "$HOME/.shellenv.local" ]; then
    source "$HOME/.shellenv.local"
fi

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    
    autoload -Uz compinit
    compinit
fi
