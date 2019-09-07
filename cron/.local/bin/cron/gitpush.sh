#!/bin/sh

# Automatically push git repositories when connected to internet

internet() { ping -q -c 1 1.1.1.1 > /dev/null || exit ;}

pushRepo() {
	for repo in $REPOS/*;do
		git -C $repo push origin master > /dev/null || continue
	done
}

internet
pushRepo
