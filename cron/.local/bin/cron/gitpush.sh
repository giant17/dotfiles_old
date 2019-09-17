#!/bin/sh

# Automatically push git repositories when connected to internet

internet() { ping -q -c 1 1.1.1.1 > /dev/null || exit ;}

REPOS=$HOME/Projects
pushRepo() {
	repos=$(find $REPOS -maxdepth 2 -mindepth 2 -type d)
	for repo in $repos;do
		git -C $repo push origin master > /dev/null || continue
	done
}

internet
pushRepo
