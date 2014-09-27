# the path to the dofiles is modified by the installer
DOTPATH=
export DOTPATH
export ZSH=$DOTPATH/shell/prezto

source $ZSH/init.zsh
source $DOTPATH/shell/aliases
source $DOTPATH/shell/custom
