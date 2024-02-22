#!/bin/bash

# 提交信息
echo "请输入提交信息: "
read input

# 添加所有更改到暂存区
git add -A

# 提交
git commit -m "$input"

# 推送到远程的main分支
git push origin main
