#!/usr/bin/env bash

set -e

local_path="$(dirname "${BASH_SOURCE}")"
local_path="`( cd \"$local_path\" && pwd )`"

git pull

exclude=(install.sh README.mkd shell config)

sed -i "/^DOTPATH=/s,=.*,=${local_path}," "zshrc"

for file in *; do
  if ! [[ ${exclude[*]} =~ $file ]]; then
    if ! [[ "install.sh" =~ $file || -e ~/$file ]]; then
      ln -sfnv "${PWD}/${file#$HOME/}" "${HOME}/.${file}"
    fi
  fi
done

ln -sfnv "${PWD}/config/nvim" "${HOME}/.config/nvim"
ln -sfnv "${PWD}/config/termite" "${HOME}/.config/termite"
ln -sfnv "${PWD}/config/htop" "${HOME}/.config/htop"
