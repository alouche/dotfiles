#!/usr/bin/env bash

local_path="$(dirname "${BASH_SOURCE}")"
local_path="`( cd \"$local_path\" && pwd )`"

git pull origin master
git submodule sync
git submodule update --init --recursive
git submodule foreach git pull origin master

exclude=(install.sh README.mkd shell)

sed -i "/^DOTPATH=/s,=.*,=${local_path}," "zshrc"

for file in *; do
  if ! [[ ${exclude[*]} =~ $file ]]; then
    if ! [[ "install.sh" =~ $file || -e ~/$file ]]; then
      ln -sfnv "$PWD/${file#$HOME/}" "${HOME}/.${file}"
    fi
  fi
done

ln -sfv "$PWD/shell/prezto" "$HOME/.zprezto"

pushd .
cd "$HOME/.vim/bundle/YouCompleteMe"
./install.sh --clang-completer
if [ -f "/etc/arch-release" ]
then
  rm -f ./third_party/ycmd/libclang.so
  ln -s /usr/lib/libclang.so ./third_party/ycmd/libclang.so
fi
popd
