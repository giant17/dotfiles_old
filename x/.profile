# Define variables

# Programs

# Directories

# Files
export BIB="$HOME/.local/share/latex/bibliography.bib"
export PATH="$PATH:$HOME/.local/bin:$(du $HOME/.local/bin/* | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export BROWSERCLI="w3m"
export READER="zathura"
export FILE="lf"
export SUDO_ASKPASS="$HOME/.local/bin/X/apass"
export ZDOTDIR="$HOME/.config/zsh"
#export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
#export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
#export INPUTRC="$HOME/.config/inputrc"
#export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export MATLAB_PREFDIR="$HOME/.local/share/matlab/R2019b"
export GOROOT="/usr/local/go"
export GOPATH="$HOME/.local/share/go"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
# FOLDERS
export DATASETS="$HOME/.local/share/datasets"
export REPOS="$HOME/repos"
export BRAINSTORM="$HOME/.matlab/toolbox/brainstorm"

export FILES="$HOME/.config/shortcuts/files"
export DIRECTORIES="$HOME/.config/shortcuts/directories"
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
export PYTHONPATH="$HOME/.local/bin/python:${PYTHONPATH}:$HOME/.scripts/python"
export TEXMFHOME="$HOME/.config/texmf"
#export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!.git/*"'
export MATLAB_LOG_DIR="$HOME/.local/share/logs"

# export FZF_DEFAULT_OPTS='
#   --color=bg+:#073642,spinner:#719e07,hl:#586e75
#   --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
#   --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07
# '

export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

echo "$0" | grep "zsh$" >/dev/null && [ -f ~/.config/zsh/.zshrc ] && source "$ZDOTDIR/.zshrc"

[ "$(tty)" = "/dev/tty1" ] && exec startx
sudo -n loadkeys ~/.config/ttymaps.kmap 2>/dev/null
