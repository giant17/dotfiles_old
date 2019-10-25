
stty -ixon
shopt -s autocd
HISTSIZE= HISTFILESIZE=
export PS1="\[\e[31m\][\[\e[m\]\[\e[33m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\] "
[ -f "$HOME/.config/aliases" ] && source "$HOME/.config/aliases"
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"

export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"


# TODO: [ "$(tty)" = "/dev/tty1" ] && exec startx

# TODO: Check ttymaps
#sudo -n loadkeys ~/.local/share/ttymaps.kmap 2>/dev/null

export REPOS="$HOME/repos"

export EDITOR="nvim"
export BROWSER="firefox"


export PATH="$PATH:$HOME/.local/bin"
export MATLAB_LOG_DIR="$HOME/.local/share/logs"
export _JAVA_AWT_WM_NONREPARENTING=1
export GOROOT="/usr/local/go"
export GOPATH="$HOME/.local/share/go"
#export BIB="$HOME/.local/share/latex/bibliography.bib"

