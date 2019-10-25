export bib="$home/.local/share/latex/bibliography.bib"
export path="$path:$home/.local/bin"
export editor="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export browsercli="w3m"
export reader="zathura"
export file="lf"
export SUDO_ASKPASS="$home/.local/bin/x/apass"
export zdotdir="$home/.config/zsh"
#export notmuch_config="$home/.config/notmuch-config"
#export gtk2_rc_files="$home/.config/gtk-2.0/gtkrc-2.0"
#export inputrc="$home/.config/inputrc"
#export password_store_dir="$home/.local/share/password-store"
export matlab_prefdir="$home/.local/share/matlab/r2019b"
export goroot="/usr/local/go"
export gopath="$home/.local/share/go"
export path="$gopath/bin:$goroot/bin:$path"
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
export matlab_log_dir="$home/.local/share/logs"

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

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

[ "$(tty)" = "/dev/tty1" ] && exec startx
# sudo -n loadkeys ~/.config/ttymaps.kmap 2>/dev/null
