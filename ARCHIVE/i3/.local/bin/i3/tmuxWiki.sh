#!/bin/sh

# Initialize a tmux sessions for wiki

createTmux() {
	tmux new-session -s "dropdown_wiki" -n "wiki" -d
	tmux send-keys -t "dropdown_wiki" 'nvim -c VimwikiMakeDiaryNote' C-m
	tmux attach -t "dropdown_wiki"
}

tmux attach -t "dropdown_wiki" || createTmux
