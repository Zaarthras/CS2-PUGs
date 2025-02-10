#!/bin/bash

session="cs2-pug"

if ! tmux has-session -t $session 2>/dev/null; then
  echo 'Server is already stopped.'
else
  tmux send-keys -t $session 'deactivate' C-c Enter 'exit' Enter
  sleep 1s
  echo 'Server has been stopped.'
fi
