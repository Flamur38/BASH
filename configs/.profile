# ~/.bash_profile – runs for login shells only

# Load .bashrc for interactive features
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Case-insensitive tab-completion
if [[ $- == *i* ]]; then
  bind 'set completion-ignore-case on'
fi

# Custom Aliases
