#!/bin/bash

# XXX - need to make install less manual so can deploy to raspberry pi's with script
# as is this is just for main dev box and is manually setup.
# sudo apt install dropbox
# dropbox autostart
# dropbox start
# dropbox exclude 

CURRENTDATE=`date +"%Y-%m-%d"`

HOSTNAME=$(hostname)
sudo mkdir $HOME/Dropbox/backups/$HOSTNAME
sudo mkdir $HOME/Dropbox/backups/$HOSTNAME/$CURRENTDATE

sudo rsync 
  -aAXv
  # XXX for testing purposes uncomment
  #--dry-run
  --delete
  --exclude=/dev/*
  --exclude=/proc/*
  --exclude=/sys/*
  --exclude=/tmp/*
  --exclude=/run/*
  --exclude=/mnt/*
  --exclude=/media/*
  --exclude="swapfile"
  --exclude="lost+found"
  --exclude=".cache"
  --exclude="Downloads"
  --exclude=".VirtualBoxVMs"
  --exclude="ecryptfs"
  --exclude=$HOME/Dropbox/*
  --exclude=.steam/*
  / $HOME/Dropbox/backups/$HOSTNAME/$CURRENTDATE
