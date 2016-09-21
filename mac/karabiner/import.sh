#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.jis_escape2eisuuAndEscape_terminal 1
/bin/echo -n .
$cli set repeat.initial_wait 250
/bin/echo -n .
$cli set repeat.wait 33
/bin/echo -n .
/bin/echo
