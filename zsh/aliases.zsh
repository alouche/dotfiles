alias ls='ls --color=tty'
alias timer='echo "Timer started. Stop with Ctrl-D." && date && cat && date'
alias week='date +%V'
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias vi="nvim"
alias vim="nvim"
alias lock="i3lock -c 000000"
alias lsuspend="sudo pm-suspend | lock"
alias appson="sudo netstat -lantp | grep -i stab | awk -F/ '{print $2}' | sort | uniq"
alias netscan='sudo iwlist wlan0 scan'
alias netapps="lsof -P -i -n | cut -f 1 -d ' '| uniq | tail -n +2"
alias u="sudo sh -c 'pacman -Syu'"
alias cu="sudo sh -c 'pacman -Rscn $(pacman -Qtdq) && pacman -Sc && pacman-optimize'"

drm() {
  docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
}

dri() {
  docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

[[ -f "$HOME/.shell-custom" ]] && source "$HOME/.shell-custom"
