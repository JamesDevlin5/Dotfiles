#!/usr/bin/env bash

COMPLETIONS_DIR="$HOME/.zsh_functions"

if [[ ! -d "$COMPLETIONS_DIR" ]]; then
  printf 'Creating completions dir. Add this to the shell fpath!\n  > %s\n\n' "$COMPLETIONS_DIR"
  mkdir -p "$COMPLETIONS_DIR"
fi

get_file() {
  FILE_NAME="_$1"
  FILE_URL="$2"

  FILE_PATH="$COMPLETIONS_DIR/$FILE_NAME"

  if [[ ! -f "$FILE_PATH" ]]; then
    printf 'Getting: %s...\n' "$FILE_NAME"
    curl -sL -o "$FILE_PATH" "$FILE_URL"
  else
    printf 'Found local installation of: %s!\n' "$FILE_NAME"
  fi
}

get_file "mvn" 'https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_mvn'
get_file "bitcoin-cli" 'https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_bitcoin-cli'
get_file "envdir" 'https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_envdir'
get_file "golang" 'https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_golang'
get_file "gpgconf" 'https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_gpgconf'
get_file "nftables" 'https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_nftables'
get_file "openssl" 'https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_openssl'
get_file "redis" 'https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_redis-cli'
get_file "shellcheck" 'https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_shellcheck'
get_file "udisksctl" 'https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_udisksctl'
get_file "xsel" 'https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_xsel'

