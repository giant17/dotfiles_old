# Define variables

export PATH="$PATH:$HOME/.local/bin:$(du $HOME/.local/bin/* | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export WM="dwm"
export BAR="slstatus"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="qutebrowser"
export BROWSERCLI="w3m"
# TODO: ASKPASS
export READER="zathura"
export FILE="vifmrun"
# TODO: Music
# TODO: Shell

# FOLDERS
export REPOS="$HOME/Projects"

export FILES="$HOME/.config/shortcuts/files"
export DIRECTORIES="$HOME/.config/shortcuts/directories"
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
export PYTHONPATH="$HOME/.local/bin/python:${PYTHONPATH}:$HOME/.scripts/python"
export BIB="$HOME/documents/latex/bibliography.bib"
export TEXMFHOME="$HOME/.config/texmf"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!.git/*"'
export MATLAB_LOG_DIR='/var/log'

# export FZF_DEFAULT_OPTS='
# 	--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
# 	--color info:254,prompt:37,spinner:108,pointer:235,marker:235
# '

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
sudo -n loadkeys ~/.config/ttymaps.kmap 2>/dev/null
