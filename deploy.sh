# Copyright [2023 - now] [Tritium Developers]
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
# limitations under the License.

#!/bin/bash

# 提交信息
echo "请输入提交信息: "
read input

# 添加所有更改到暂存区
git add -A

# 提交
git commit -m "$input"
#同步远程仓库文件
git pull
# 推送到远程的main分支
git push origin main
