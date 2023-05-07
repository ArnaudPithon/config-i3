#!/usr/bin/env dash
# vim: ft=sh
# $Id$
# Last modified: 2018-11-04 18:53:02+0100

_term() {
	APP=$@
	tmux ls 2> /dev/null | grep "^$APP:" &&\
		command urxvtc -name $APP -e tmux attach -t $APP
	command urxvtc -name $APP -e tmux new -s $APP
	}

urxvtc -name mail

_term v
_term main
_term pad

#luakit &
#kaffeine
