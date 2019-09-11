HISTSIZE= HISTFILESIZE= #Infinite History
# Define Prompt config

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

sh $HOME/.local/bin/bash/tty-solarized-dark.sh
[ -f "$HOME/.config/shortcuts/aliases" ] && source "$HOME/.config/shortcuts/aliases"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
