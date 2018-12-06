#!/bin/sh 
killall tmux
DEV_PATH="~/Projects/CorrelatePro"
SESSION="CorrelatePro"
tmux -2 new-session -d -s $SESSION
tmux send-keys "cd $DEV_PATH; workon CorrelatePro; clear" C-m
tmux split-window -v
tmux select-pane -t 0
tmux resize-pane -D 11
tmux select-pane -t 1
tmux send-keys "VBoxManage controlvm 'dev' poweroff" C-m
tmux send-keys "clear" C-m
tmux send-keys "cd $DEV_PATH" C-m
tmux send-keys "clear" C-m
tmux send-keys "VBoxManage startvm 'dev' --type headless" C-m
tmux send-keys "clear" C-m
tmux send-keys "workon CorrelatePro" C-m
tmux send-keys "clear" C-m
tmux send-keys "eval \$(docker-machine env dev)" C-m
tmux send-keys "docker-machine ls" C-m
#tmux send-keys "sudo docker-compose -f local.yml build" C-m
tmux send-keys "b && u" C-m
#tmux send-keys "sudo docker-compose -f local.yml up" C-m
tmux -2 attach-session -t $SESSION
