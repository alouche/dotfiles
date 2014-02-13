
alias timer='echo "Timer started. Stop with Ctrl-D." && date && cat && date'

alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

alias rbenv-lock='rbenv local "$(rbenv version-name)"'

alias lock="i3lock"
alias lsuspend="sudo pm-suspend | lock"
alias appson="sudo netstat -lantp | grep -i stab | awk -F/ '{print $2}' | sort | uniq"
alias netscan='sudo iwlist wlan0 scan'
alias netapps="lsof -P -i -n | cut -f 1 -d ' '| uniq | tail -n +2"

# fun stuff
alias freechess='telnet fics.freechess.org 5000'
alias guitartune='for n in E2 A2 D3 G3 B3 E4;do play -n synth 4 pluck $n repeat 2;done'
alias matrix='echo -e "\e[32m"; while :; do for i in {1..16}; do r="$(($RANDOM % 2))"; if [[ $(($RANDOM % 5)) == 1 ]]; then if [[ $(($RANDOM % 4)) == 1 ]]; then v+="\e[1m $r   "; else v+="\e[2m $r   "; fi; else v+="     "; fi; done; echo -e "$v"; v=""; done'
