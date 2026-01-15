#!/usr/bin/env zsh
# ============================================
# ZSHRC — interactive shell only
# ============================================

# ---- oh-my-zsh ----
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  asdf
)

source "$ZSH/oh-my-zsh.sh"

# ---- Aliases ----
alias vi="nvim"


# ---- empty line ----
precmd() { print }


# ---- Bun completions (safe) ----
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# ---- pnpm completions (optional) ----
[[ -f "$HOME/.local/share/pnpm/pnpm.zsh" ]] && source "$HOME/.local/share/pnpm/pnpm.zsh"

