#!/sbin/sh


LOG_FILE=/storage/emulated/0/Android/ct/scheduler.log
BASE_DIR=/data/adb/modules/ct_module/module.prop


if [ -f $LOG_FILE ]; then
    if grep -q "Daemon Running" $LOG_FILE; then
        sed -i 's/description=.*/description=[😊运行中]Optimize performance ing…/' $BASE_DIR
    else
        sed -i 's/description=.*/description=[😵启动失败]Optimize performance ing…/' $BASE_DIR
    fi
fi