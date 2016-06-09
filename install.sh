#!/usr/bin/env bash

set -e

local_path="$(dirname "${BASH_SOURCE}")"
local_path="`( cd \"$local_path\" && pwd )`"

git pull

exclude=(install.sh README.mkd shell termite)
prezto="${ZDOTDIR:-$HOME}/.zprezto"

if [ -d "$prezto" ]
then
  pushd . 2> /dev/null
  cd "$prezsto"
  git pull && git submodule update --init --recursive
  popd 2> /dev/null
else
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi


sed -i "/^DOTPATH=/s,=.*,=${local_path}," "zshrc"

for file in *; do
  if ! [[ ${exclude[*]} =~ $file ]]; then
    if ! [[ "install.sh" =~ $file || -e ~/$file ]]; then
      ln -sfnv "${PWD}/${file#$HOME/}" "${HOME}/.${file}"
    fi
  fi
done

ln -sfnv "${PWD}/nvim" "${HOME}/.config/nvim"
ln -sfnv "${PWD}/termite" "${HOME}/.config/termite"
