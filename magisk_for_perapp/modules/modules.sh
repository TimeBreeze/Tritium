#!/system/bin/sh
SKIPUNZIP=0

echo "  _______   _ _   _                 ";
echo " |__   __| (_| | (_)                ";
echo "    | |_ __ _| |_ _ _   _ _ __ ___  ";
echo "    | |  __| | __| | | | |  _   _ \ ";
echo "    | | |  | | |_| | |_| | | | | | |";
echo "    |_|_|  |_|\__|_|\__,_|_| |_| |_|";
echo "                                    ";
echo "                                    ";


# 检查音量键点击以确认安装模块
check_and_install_module() {
    echo "   即将为您安装掉帧监测模块"
    echo "   单击音量上键即可确认安装"
    echo "   单击音量下键取消安装（不推荐)"
    key_click=""  # 初始化变量 key_click 为空字符串

    # 进入循环，等待用户按下音量键
    while [ "$key_click" = "" ]; do
        # 获取设备事件中包含 'KEY_' 的部分，并赋值给 key_click
        key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
        sleep 0.2  # 等待 0.2 秒，避免过于频繁地检测事件
    done

    case "$key_click" in
        "KEY_VOLUMEUP")
            echo "   您已确认安装，请稍候"
            install_cu_jank_detector
            echo "   * 已为您安装掉帧监测模块"  # 使用参数指定模块名称
            echo "   * 感谢您的支持与信任"
        ;;
        *)
            echo "   非常遗憾"
            echo "   已为您取消安装"  # 使用参数指定模块名称
    esac
    
    
    key_click=""  # 初始化变量 key_click 为空字符串
    echo "   即将为您安装解除系统性能限制模块"
    echo "   单击音量上键即可确认安装"
    echo "   单击音量下键取消安装"
    # 进入循环，等待用户按下音量键
    while [ "$key_click" = "" ]; do
        # 获取设备事件中包含 'KEY_' 的部分，并赋值给 key_click
        key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
        sleep 0.2  # 等待 0.2 秒，避免过于频繁地检测事件
    done
    
    case "$key_click" in
        "KEY_VOLUMEUP")
            
            echo "   您已确认安装，请稍候"
            install_break_system_limit
            echo "   * 已为您安装解除系统性能限制模块"  # 使用参数指定模块名称
            echo "   * 感谢您的支持与信任"
        ;;
        *)
            echo "   非常遗憾"
            echo "   已为您取消安装"  # 使用参数指定模块名称
    esac
    
}

install_cu_jank_detector() {
    echo "   - 正在为您安装掉帧监测模块"
    magisk --install-module "$MODPATH"/modules/cu_jank_detector.zip
    rm -rf "$MODPATH"/modules/cu_jank_detector.zip
}

install_break_system_limit() {
    echo "   - 正在为您安装解除系统性能限制模块"
    magisk --install-module "$MODPATH"/modules/break_system_limit.zip
    rm -rf "$MODPATH"/modules/break_system_limit.zip
}



# 调用 check_and_install_module 函数
check_and_install_module

