﻿#!/bin/bash

session="cs2-pug"

if ! tmux has-session -t $session 2>/dev/null; then
  tmux new -d -s $session
  tmux send-keys -t $session 'source .venv/bin/activate' Enter 'python3 run.py' Enter
  sleep 1s
  echo 'Server has been started.'
else
  echo 'Server is already running.'
fi
