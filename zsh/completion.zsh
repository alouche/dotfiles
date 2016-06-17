fpath=(/usr/share/zsh/site-functions $HOME/.zsh/func $fpath)
autoload -Uz compinit
compinit
(( ${+_comps} )) || return 1

zstyle ':completion:*'              use-compctl false
zstyle ':completion:*'              verbose true
zstyle ':completion:*'              completer _expand _complete _correct _approximate
zstyle ':completion::complete:*'    use-cache on
zstyle ':completion::complete:*'    cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*'              format 'Completing %d'
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages'     format '%d'
zstyle ':completion:*:warnings'     format 'No matches for: %d'
zstyle ':completion:*:corrections'  format '%B%d (errors: %e)%b'

zstyle ':completion:*'              group-name ''
zstyle ':completion:*'              auto-description 'specify: %d'
zstyle ':completion:*'              menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*:default'      list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*'              list-colors ''
zstyle ':completion:*'              matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*'              menu select=1 _complete _ignored _approximate

zstyle ':completion:*'              list-prompt %SAt %p: hit TAB for more, or the character to insert%s
zstyle ':completion:*'              select-prompt %SScrolling active: current selection at %p%s
