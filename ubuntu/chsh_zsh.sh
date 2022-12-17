#!/bin/sh
set -e

shells_file=/etc/shells

# https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
if ! zsh=$(command -v zsh) || ! grep -qx "$zsh" "$shells_file"; then
  if ! zsh=$(grep '^/.*/zsh$' "$shells_file" | tail -n 1) || [ ! -f "$zsh" ]; then
    echo "no zsh binary found or not present in '$shells_file'"
    return
  fi
fi

if [ "$SHELL" != "$zsh" ]; then
  echo "==> Changing your shell from $SHELL to $zsh"

  sudo -k chsh -s "$zsh" "$USER" # -k forces the password prompt
  exit_code=$?

  # Check if the shell change was successful
  if [ "$exit_code" -eq 0 ]; then
    export SHELL="$zsh"
    echo "Shell successfully changed to $zsh"
  else
    echo "chsh command unsuccessful"
  fi
fi

echo "current shell: $SHELL"