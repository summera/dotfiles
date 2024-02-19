# Taken from https://github.com/sorin-ionescu/prezto/blob/master/modules/tmux/init.zsh

if [[ -z "$TMUX" && -z "$EMACS" && -z "$VIM" && -z "$INSIDE_EMACS" && "$TERM_PROGRAM" != "vscode" && "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]]; then
  tmux start-server

  # Create a 'prezto' session if no session has been defined in tmux.conf.
  if ! tmux has-session 2> /dev/null; then
    tmux \
      new-session -d -s base \; \
      set-option -t base destroy-unattached off &> /dev/null
  fi

  # Attach to the 'base' session or to the last session used. (detach first)
  exec tmux attach-session -d
fi
