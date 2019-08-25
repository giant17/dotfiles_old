# Define variables
# TODO: Set mpd starting, without output
# TODO: Autostart startx
# TODO: Set all vairables, like Window Manager



export PATH="$PATH:$HOME/.local/bin:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="qutebrowser"
export SUDO_ASKPASS="$HOME/.scripts/dmenu/pass.sh"
export READER="zathura"
export FILE="vifmrun"
export SERVER="gian@gianlucatadori.xyz"
export BACKUP="$SERVER:/mnt/4TB/backups/debian"
export _JAVA_AWT_WM_NONREPARENTING=1 # MATLAB for WM
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
export PYTHONPATH="$HOME/.local/bin/python:${PYTHONPATH}:$HOME/.scripts/python"
export BIB="$HOME/documents/latex/bibliography.bib"
export TEXMFHOME="$HOME/.config/texmf"
export XDG_CONFIG_HOME="$HOME/.config"

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"
# mpd > /dev/null 2>&1 &

# Autostart startx
# [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Switch escape and caps if tty:
sudo -n loadkeys ~/.ttymaps.kmap 2>/dev/null
