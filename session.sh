#!/usr/bin/env dash
# vim: ft=sh
# $Id$
# Last modified: 2023-05-16 11:09:14+0200


if [ -x /bin/alacritty ]
  then
    _term() {
      APP=$@
      tmux ls 2> /dev/null | grep "^$APP:" &&\
        command alacritty --class $APP,alacritty -e tmux attach -t $APP &
      command alacritty --class $APP,alacritty -e tmux new -s $APP &
    }
  elif [ -x /usr/bin/urxvtc ]
  then
    _term() {
      APP=$@
      tmux ls 2> /dev/null | grep "^$APP:" &&\
        command urxvtc -name $APP -e tmux attach -t $APP
      command urxvtc -name $APP -e tmux new -s $APP
    }
  else
    _term() {
      APP=$@
      tmux ls 2> /dev/null | grep "^$APP:" &&\
        command xterm -name $APP -e tmux attach -t $APP
      command xterm -name $APP -e tmux new -s $APP
    }
fi

alacritty --class,alacritty mail &

_term v
_term main
_term pad

#luakit &
#kaffeine
