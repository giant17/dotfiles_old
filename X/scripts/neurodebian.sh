#!/bin/sh

wget -O- http://neuro.debian.net/lists/buster.de-md.full | sudo tee /etc/apt/sources.list.d/neurodebian.sources.list
apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net:80 0xA5D32F012649A5A9
apt-get update

apt-get install -y octave-psychtoolbox-3
apt-get install -y octave-psychtoolbox-3-nonfree
apt-get install -y matlab-psychtoolbox-3
apt-get install -y matlab-psychtoolbox-3-nonfree
apt-get install -y matlab-psychtoolbox-3-nonfree
apt-get install -y python-mne

ln -sf /usr/local/MATLAB/*/bin/glnxa64/mlint $HOME/.local/bin/matlab/
