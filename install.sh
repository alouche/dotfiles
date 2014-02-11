#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

#git pull origin master
#git submodule sync
#git submodule update --init --recursive

exclude=(install.sh, README.mkd)

for file in *; do
  if ! [[ ${exclude[*]} =~ $file ]]; then
    if ! [[ "install.sh" =~ $file || -e ~/$file ]]; then
      ln -sfnv $PWD/${file#$HOME/} "${HOME}/.${file}"
    fi
  fi
done
