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
	if [ ! -d $lean_git_repo/$package ]
	then
		echo "warn: no real dir for $lean_git_repo/$package"
		continue
	fi
	category_dir=`echo "$package" | sed 's/\([a-z]\+\)\/\([a-z]\+\)\/.\+/\\1_\\2/'`
	package_name=`basename $package`
	echo "$package map to cat: $category_dir, pkg: $package_name"
	if [ ! -d $parent/lean-pkgs/$category_dir ]
	then
		mkdir -p $parent/lean-pkgs/$category_dir
	fi
	
	if [ ! -h $parent/lean-pkgs/$category_dir/$package_name ]
	then
		ln -s $lean_git_repo/$package $parent/lean-pkgs/$category_dir
	fi
done

