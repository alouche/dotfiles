# the path to the dofiles is modified by the installer
DOTPATH=
export DOTPATH

#export ZSH=$DOTPATH/shell/oh-my-zsh
export ZSH=$DOTPATH/shell/prezto
#ZSH_THEME="agnoster"

#DISABLE_AUTO_UPDATE="true"
#COMPLETION_WAITING_DOTS="true"

#plugins=(git)

source $ZSH/init.zsh
source $DOTPATH/shell/aliases
source $DOTPATH/shell/custom
