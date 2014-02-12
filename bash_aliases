
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
alias ohyeah='for ((;;)); do echo -ne "\033[$((1+RANDOM%LINES));$((1+RANDOM%COLUMNS))H\033[$((RANDOM%2));3$((RANDOM%8))m$((RANDOM%10))"; sleep 0.1 ; done'
alias matrix='echo -e "\e[32m"; while :; do for i in {1..16}; do r="$(($RANDOM % 2))"; if [[ $(($RANDOM % 5)) == 1 ]]; then if [[ $(($RANDOM % 4)) == 1 ]]; then v+="\e[1m $r   "; else v+="\e[2m $r   "; fi; else v+="     "; fi; done; echo -e "$v"; v=""; done'
alias matrix2='echo -e "\e[31m"; while $t; do for i in `seq 1 30`;do r="$[($RANDOM % 2)]";h="$[($RANDOM % 4)]";if [ $h -eq 1 ]; then v="\e[1m $r";else v="\e[2m $r";fi;v2="$v2 $v";done;echo -e $v2;v2="";done;'
alias matrix3='COL=$(( $(tput cols) / 2 )); clear; tput setaf 2; while :; do tput cup $((RANDOM%COL)) $((RANDOM%COL)); printf "%$((RANDOM%COL))s" $((RANDOM%2)); done'                        
alias matrix4='echo -ne "\e[32m" ; while true ; do echo -ne "\e[$(($RANDOM % 2 + 1))m" ; tr -c "[:print:]" " " < /dev/urandom | dd count=1 bs=50 2> /dev/null ; done'
alias matrix5='tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=lcase,unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
