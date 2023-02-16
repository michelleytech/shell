#!/bin/env bash

#https://repo.anaconda.com/archive
ANACONDASH=Anaconda3-2022.10-Linux-x86_64.sh

# install anaconda
sudo apt-get update
sudo apt-get -y install wget
wget https://repo.anaconda.com/archive/$ANACONDASH
bash $ANACONDASH -b -p $HOME/anaconda3
rm $ANACONDASH

exit 0
