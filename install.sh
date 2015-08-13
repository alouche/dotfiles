#!/usr/bin/env bash

local_path="$(dirname "${BASH_SOURCE}")"
local_path="`( cd \"$local_path\" && pwd )`"

git pull
git submodule update --init --recursive
git submodule foreach git pull origin master

exclude=(install.sh README.mkd shell)

sed -i "/^DOTPATH=/s,=.*,=${local_path}," "zshrc"

ln -sfv "$PWD/shell/prezto" "$HOME/.zprezto"

for file in *; do
  if ! [[ ${exclude[*]} =~ $file ]]; then
    if ! [[ "install.sh" =~ $file || -e ~/$file ]]; then
      ln -sfnv "$PWD/${file#$HOME/}" "${HOME}/.${file}"
    fi
  fi
done

