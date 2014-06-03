#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

git pull origin master
git submodule sync
git submodule update --init --recursive
git submodule foreach git pull origin master

exclude=(install.sh README.mkd)

for file in *; do
  if ! [[ ${exclude[*]} =~ $file ]]; then
    if ! [[ "install.sh" =~ $file || -e ~/$file ]]; then
      ln -sfnv "$PWD/${file#$HOME/}" "${HOME}/.${file}"
    fi
  fi
done

# Post actions
cd "$HOME/.vim/bundle/YouCompleteMe"
git submodule update --init --recursive
./install.sh --clang-completer
cd -
