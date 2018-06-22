

# PATH ALTERATIONS
## Node
PATH="/usr/local/bin:$PATH:./node_modules/.bin";

killport() { lsof -i tcp:"$@" | awk 'NR!=1 {print $2}' | xargs kill -9 ;}
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

# git aliases
alias gc="git commit -m $1";
alias gs="git status";
alias gp="git pull";
alias gf="git fetch";
alias gpush="git push";
alias gd="git diff";
alias ga="git add .";
