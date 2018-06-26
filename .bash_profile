
#PROMPT STUFF
GREEN=$(tput setaf 2);
YELLOW=$(tput setaf 3);
BLUE=$(tput setaf 4);
WHITE=$(tput setaf 7);
RESET=$(tput sgr0);

EMOJI_WINTER="$(rand_element 🐿 ⛄ 🌲 ☃️)"
EMOJI_SUMMER="$(rand_element 🐿 ☀️ 😎)"
EMOJI_SPRING="$(rand_element 🐿 🌻 🐰)"
EMOJI_FALL="$(rand_element 🐿 🍂 🍁)"
EMOJI_RANDOM="$(rand_element 🐿 🐹 🍔)"

function git_branch {
  # Shows the current branch if in a git repository
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \(\1\)/';
}

rand() {
  printf $((  $1 *  RANDOM  / 32767   ))
}
rand_element () {
  local -a th=("$@")
  unset th[0]
  printf $'%s\n' "${th[$(($(rand "${#th[*]}")+1))]}"
}

containsElement () {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}

WINTER_MONTHS=("Dec" "Jan" "Feb")
SPRING_MONTHS=("Mar" "Apr" "May")
SUMMER_MONTHS=("Jun" "Jul" "Aug")
FALL_MONTHS=("Sep" "Oct" "Nov")

now=$(date)
echo "current date: $now"

month=$(date +"%b")
echo "current month: $month"


if containsElement $month "${SUMMER_MONTHS[@]}"
then
PS1="${YELLOW}\w${GREEN}\$(git_branch)${RESET}\n${EMOJI_SUMMER}  $ ";
elif containsElement $month "${FALL_MONTHS[@]}"
then
PS1="${YELLOW}\w${GREEN}\$(git_branch)${RESET}\n${EMOJI_FALL}  $ ";
elif containsElement $month "${WINTER_MONTHS[@]}"
then
PS1="${YELLOW}\w${GREEN}\$(git_branch)${RESET}\n${EMOJI_WINTER}  $ ";
elif containsElement $month "${SPRING_MONTHS[@]}"
then
PS1="${YELLOW}\w${GREEN}\$(git_branch)${RESET}\n${EMOJI_SPRING}  $ ";
else
PS1="${YELLOW}\w${GREEN}\$(git_branch)${RESET}\n${EMOJI_RANDOM}  $ ";
fi

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
