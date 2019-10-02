#!/bin/sh

# Attach or create if not exist to a tmux session

tmux attach-session -t scratchterm || tmux new-session -s scratchterm
