# the path to the dofiles is modified by the installer
DOTPATH=
export DOTPATH

export ZSH=$DOTPATH/shell/oh-my-zsh
ZSH_THEME="agnoster"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $DOTPATH/shell/aliases
source $DOTPATH/shell/custom
