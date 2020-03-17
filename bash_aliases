# Unix
alias ll="ls -al"
alias ln="ln -v"
alias mkdir="mkdir -p"
alias e="$EDITOR"
alias v="$VISUAL"

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# alias to setup nodejs development environment
alias node-dev='export NODE_ENV=development'

# alias to setup nodejs production environment
alias node-prod='export NODE_ENV=production'

# Include custom aliases
if [[ -f ~/.bash_aliases.local ]]; then
  source ~/.bash_aliases.local
fi
