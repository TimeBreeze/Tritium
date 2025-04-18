# Copyright 2023 - present Tritium Developers
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License..


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