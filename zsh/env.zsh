unset TMOUT
typeset -gU PATH GOPATH

export GOPATH=$HOME/.gopath
export GEM_HOME=$HOME/.gems
export GEM_PATH=$HOME/.gems
export PATH=$HOME/.pbin:$HOME/.lbin:$HOME/.gems/bin:$GOPATH/bin:$PATH
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export ARCHFLAGS="-arch x86_64"
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

typeset -ga ls_options
ls_options+=( --color=auto )

typeset -ga grep_options
grep_options+=( --color=auto )

export EDITOR=${EDITOR:-nvim}
export PAGER=${PAGER:-less}

SAVEHIST=1000
HISTFILE=~/.zsh_history

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

for var in LANG LC_ALL LC_MESSAGES ; do
    [[ -n ${(P)var} ]] && export $var
done

typeset -U path cdpath fpath manpath

builtin unset -v var
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
