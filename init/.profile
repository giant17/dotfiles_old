# export BIB="$HOME/.local/share/latex/bibliography.bib"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
export PATH="$PATH:$HOME/.local/bin"
export EDITOR="nvim"
export TERMINAL="st"
export TERM="xterm"
export BROWSER="qutebrowser --target=auto"
export BROWSERCLI="w3m"
export READER="zathura"
export FILE="lf"
export SUDO_ASKPASS="$HOME/.local/bin/x/apass"
export ZDOTDIR="$HOME/.config/zsh"
#export notmuch_config="$home/.config/notmuch-config"
#export gtk2_rc_files="$home/.config/gtk-2.0/gtkrc-2.0"
#export inputrc="$home/.config/inputrc"
#export password_store_dir="$home/.local/share/password-store"

# export MATLAB_PREFDIR="$HOME/.local/share/matlab/r2019b"
# export GOROOT="/usr/local/go"
# export GOPATH="$HOME/.local/share/go"
# export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
# folders
export datasets="$home/.local/share/datasets"
export repos="$home/repos"
export brainstorm="$home/.matlab/toolbox/brainstorm"

export files="$home/.config/shortcuts/files"
export directories="$home/.config/shortcuts/directories"
export _java_awt_wm_nonreparenting=1
export _java_options='-dawt.usesystemaafontsettings=on'
export pythonpath="$home/.local/bin/python:${pythonpath}:$home/.scripts/python"
export texmfhome="$home/.config/texmf"
#export fzf_default_command='rg --files --no-ignore --hidden --follow -g "!.git/*"'
export MATLAB_LOG_DIR="$HOME/.local/share/logs"

# export fzf_default_opts='
#   --color=bg+:#073642,spinner:#719e07,hl:#586e75
#   --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
#   --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07
# '

export less=-r
export less_termcap_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export less_termcap_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export less_termcap_me="$(printf '%b' '[0m')"; a="${a%_}"
export less_termcap_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export less_termcap_se="$(printf '%b' '[0m')"; a="${a%_}"
export less_termcap_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export less_termcap_ue="$(printf '%b' '[0m')"; a="${a%_}"

mpd >/dev/null 2>&1 &
echo "$0" | grep "zsh$" >/dev/null && [ -f $ZDOTDIR/.zshrc ] && source "$ZDOTDIR/.zshrc"

[ "$(tty)" = "/dev/tty1" ] && exec startx
# sudo -n loadkeys ~/.config/ttymaps.kmap 2>/dev/null
