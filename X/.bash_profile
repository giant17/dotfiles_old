# Define variables
# TODO: Set mpd starting, without output
# TODO: Set all vairables, like Window Manager



export PATH="$PATH:$HOME/.local/bin:$(du $HOME/.local/bin/* | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export TERMINAL="urxvt"
export BROWSER="qutebrowser"
export BROWSERCLI="w3m"
# export SUDO_ASKPASS="$HOME/.local/bin/X/pass.sh"
export SUDO_ASKPASS="$HOME/.local/bin/X/pass.sh"
export READER="zathura"
export FILE="vifmrun"
export FILES="$HOME/.config/shortcuts/files"
export DIRECTORIES="$HOME/.config/shortcuts/directories"
export REPOS="$HOME/repos"
export SERVER="gian@gianlucatadori.xyz"
export BACKUP="$SERVER:/mnt/4TB/backups/debian"
export _JAVA_AWT_WM_NONREPARENTING=1 # MATLAB for WM
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
export PYTHONPATH="$HOME/.local/bin/python:${PYTHONPATH}:$HOME/.scripts/python"
export BIB="$HOME/documents/latex/bibliography.bib"
export TEXMFHOME="$HOME/.config/texmf"

#source $HOME/.cache/wal/colors.sh
echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"
# mpd > /dev/null 2>&1 &

#Autostart startx
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Switch escape and caps if tty:
sudo -n loadkeys ~/.config/ttymaps.kmap 2>/dev/null
