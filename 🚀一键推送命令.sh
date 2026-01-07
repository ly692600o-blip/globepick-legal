#!/bin/bash

# 一键推送命令 - 在创建 GitHub 仓库后运行

cd "/Users/liuyang/Desktop/拾物GlobePick_备份_20251210/website"

echo "🚀 准备推送到 GitHub..."
echo ""

# 检查远程仓库是否已添加
if git remote get-url origin >/dev/null 2>&1; then
    echo "✅ 远程仓库已配置: $(git remote get-url origin)"
    echo ""
    echo "📤 开始推送..."
    git push -u origin main 2>&1 || git push -u origin master 2>&1
    echo ""
    echo "✅ 推送完成！"
else
    echo "❌ 远程仓库未配置"
    echo ""
    echo "请先添加远程仓库："
    echo "  git remote add origin https://github.com/ly692600o-blip/globepick-legal.git"
    echo ""
    echo "然后运行推送："
    echo "  git push -u origin main"
fi






