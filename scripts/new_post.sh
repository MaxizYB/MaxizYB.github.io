#!/bin/bash

# 设置时区为中国时区
export TZ='Asia/Shanghai'

# 获取文章标题
echo "请输入文章标题："
read title

# 获取文章标签
echo "请输入文章标签（多个标签用空格分隔）："
read tags

# 将标签格式化为数组格式
formatted_tags=$(echo $tags | sed 's/ /, /g')

# 生成文件名（将标题转换为URL友好的格式）
filename=$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
date=$(date +%Y-%m-%d)
filepath="_posts/${date}-${filename}.md"

# 创建文章文件
cat > "$filepath" << EOF
---
layout: post
title: "${title}"
date: $(date "+%Y-%m-%d %H:%M:%S +0800")
categories: [blog]
tags: [${formatted_tags}]
---

EOF

echo "文章创建成功：$filepath"
echo "标题：$title"
echo "标签：[$formatted_tags]"
echo "时间：$(date "+%Y-%m-%d %H:%M:%S +0800")" 