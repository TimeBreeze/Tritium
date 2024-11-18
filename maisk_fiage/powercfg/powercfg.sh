#!/bin/sh

export MODE="/sdcard/Android/ct/cur_mode.txt"

set_mode() {
  echo -n "$1" > "$MODE"
}

case "$1" in
  'powersave' | 'balance' | 'performance' | 'fast')
    set_mode "$1"
    ;;
  'auto')
    set_mode 'balance'
    ;;
  'pedestal')
    set_mode 'fast'
    ;;
  'init')
    [ -x "$INIT" ] && sh "$INIT"  
    set_mode 'balance'
    ;;
  *)
    set_mode 'balance'
    ;;
esac
