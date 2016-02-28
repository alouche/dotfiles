# the path to the dofiles is modified by the installer
DOTPATH=
export DOTPATH
export ZSH="${ZDOTDIR:-$HOME}/.zprezto"

source $ZSH/init.zsh
source $DOTPATH/shell/profile
