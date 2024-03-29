#!/bin/bash
# Bashrc SSH-tmux wrapper | Spencer Tipping
# Licensed under the terms of the MIT source code license

# Source this just after the PS1-check to enable auto-tmuxing of your SSH
# sessions. See https://github.com/spencertipping/bashrc-tmux for usage
# information.

# Double-check for interactivity: $PS1 needs to be set. This allows for
# alternative interactivity-checks in .bashrc.
if [ -n "$PS1" ]; then
  TMUX_SESSION=ssh-$USER
  if [[ -n "$BASHRC_TMUX_SESSION" ]]; then
    TMUX_SESSION="$TMUX_SESSION-$BASHRC_TMUX_SESSION"
  fi

  if [[ -z "$TMUX" && -n "$SSH_CONNECTION" ]] && which tmux >& /dev/null; then
    if ! tmux ls -F '#{session_name}' | egrep -q "^$TMUX_SESSION$"; then
      tmux new-session -s $TMUX_SESSION \; detach
    fi

    # Allocating a session ID: always just bump the counter. Because of
    # differences between bash and zsh, working with arrays to densely pack
    # session IDs is cumbersome.

    session_max=$(tmux ls -F '#{session_name}' \
                  | egrep "^$TMUX_SESSION-[0-9]+$" \
                  | sed "s/^$TMUX_SESSION-//" \
                  | sort -rn \
                  | head -n1)
    session_index=$((${session_max:--1} + 1))

    exec tmux new-session -s $TMUX_SESSION-$session_index -t $TMUX_SESSION
  fi
fi