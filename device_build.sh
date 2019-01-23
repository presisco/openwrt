#!/bin/sh

cp acrh17.diff .config
make defconfig
make clean
make -j9

cp b1300.diff .config
make defconfig
make -j9

cp ac750.diff .config
make defconfig
make clean
make -j9

cp ar750.diff .config
make defconfig
make -j9

cp wr703n.diff .config
make defconfig
make -j9

cp mt300a.diff .config
make defconfig
make clean
make -j9

cp y1.diff .config
make defconfig
make -j9