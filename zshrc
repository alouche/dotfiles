setopt auto_cd
setopt extended_glob
setopt longlistjobs
setopt notify
setopt hash_list_all
setopt completeinword
setopt nohup
setopt auto_pushd
setopt nobeep
setopt pushd_ignore_dups
setopt noglobdots
setopt noshwordsplit
setopt unset

bindkey -e

for mod in parameter complist deltochar mathfunc stat zpty mapfile; do
  zmodload -i zsh/${mod} 2>/dev/null || print "Warn: no ${mod} available"
done && builtin unset -v mod

for rc ($HOME/.zsh/*.zsh); do
  source "$rc"
done

source "${ZDOTDIR:-${HOME}}/.zshrc.local"
