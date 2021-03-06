#!/bin/sh
# Copyright (C) 2013-2014 Michael Gilbert <mgilbert@debian.org>
# License: MIT

set -e

real=$debpath/usr/games/steam.real
config=$HOME/.steam
ubuntu32=$config/ubuntu12_32
exe=$ubuntu32/steam

# launch steam / do an initial update when the exe does not already exist
test ! -d $config && rm -rf $config && mkdir -p $config || true
test ! -x $config/steam.sh && rm -rf $config/package $exe || true
test ! -d $ubuntu32 && rm -rf $ubuntu32 && mkdir -p $ubuntu32 || true
test ! -x $exe && rm -rf $exe && cp $real $exe && $ubuntu32/steam || true
test -x $config/steam.sh && $config/steam.sh "$@" 2>$config/error.log
