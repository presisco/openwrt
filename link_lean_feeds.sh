#!/bin/sh

lean_git_repo=$1
if [ -z $lean_git_repo ]
then
	echo "need lean git dir!"
	echo "clone https://github.com/coolsnowwolf/lede"
	echo "then run ./scripts/feeds update -a in lean repo to get necessary packages"
	exit 1
fi

home=`pwd`
echo "current dir: $home"
parent=`dirname "$home"`
echo "make a lean link dir in parent dir: $parent"
mkdir -p $parent/lean-pkgs

for package in `cat lean-packages.txt`
do
	relative_path=`dirname $package`
	package_name=`basename $package`
	if [ ! -h $parent/lean-pkgs/$package ]
	then
		mkdir -p $parent/lean-pkgs/$relative_path
		ln -s $lean_git_repo/$package $parent/lean-pkgs/$relative_path
	fi
done

