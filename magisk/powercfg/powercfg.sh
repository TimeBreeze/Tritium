#!/bin/sh

# 设置模式文件路径
export MODE="/sdcard/Android/ct/cur_mode.txt"

set_mode() {
  echo -n "$1" > "$MODE"
}

# 主逻辑
case "$1" in
  'powersave' | 'balance' | 'performance' | 'fast')
    # 直接设置参数为模式
    set_mode "$1"
    ;;
  'auto')
    # 自动模式默认设置为balance
    set_mode 'balance'
    ;;
  'pedestal')
    # 底座模式默认设置为fast
    set_mode 'fast'
    ;;
  'init')
    # 执行初始化脚本并设置平衡模式
    [ -x "$INIT" ] && sh "$INIT"  # 确保初始化脚本可执行
    set_mode 'balance'
    ;;
  *)
    # 默认设置为balance模式
    set_mode 'balance'
    ;;
esac
