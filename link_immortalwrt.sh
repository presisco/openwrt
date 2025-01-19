#!/bin/sh

local_link_dir=/home/dev/immortalwrt-pkgs
immortalwrt_dir=/home/dev/immortalwrt

rm -r $local_link_dir
mkdir $local_link_dir
cd $local_link_dir
for pkg_path in `cat /home/dev/presisco/immortalwrt-pkgs.txt`
do
	pkg_name=`basename $pkg_path`
	echo "creating link: $pkg_name"
	ln -s $immortalwrt_dir/$pkg_path $pkg_name
done
