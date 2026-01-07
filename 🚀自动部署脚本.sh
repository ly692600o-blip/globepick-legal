#!/bin/bash

# 自动部署到 GitHub Pages
# 使用方法：在 website 目录下执行 ./🚀自动部署脚本.sh

set -e

echo "🚀 开始自动部署到 GitHub Pages..."
echo ""

# 检查是否在 website 目录
if [ ! -f "privacy-policy.html" ] || [ ! -f "terms-of-service.html" ]; then
    echo "❌ 错误: 请在 website 目录下运行此脚本"
    exit 1
fi

# 检查 git 是否已初始化
if [ ! -d ".git" ]; then
    echo "📦 初始化 git 仓库..."
    git init
    echo "✅ git 仓库已初始化"
fi

# 添加文件
echo "📝 添加文件..."
git add privacy-policy.html terms-of-service.html index.html 2>/dev/null || true
git add .gitignore 2>/dev/null || true

# 检查是否有更改
if git diff --cached --quiet 2>/dev/null; then
    echo "ℹ️  没有需要提交的更改"
else
    echo "💾 提交更改..."
    git commit -m "部署隐私政策和服务条款页面" || {
        # 如果没有配置用户信息，设置默认值
        git config user.name "GlobePick" 2>/dev/null || true
        git config user.email "globepick@example.com" 2>/dev/null || true
        git commit -m "部署隐私政策和服务条款页面"
    }
    echo "✅ 文件已提交"
fi

# 检查远程仓库
if git remote get-url origin >/dev/null 2>&1; then
    REMOTE_URL=$(git remote get-url origin)
    echo "📡 找到远程仓库: $REMOTE_URL"
    
    # 检查是否是 globepick-legal 仓库
    if [[ "$REMOTE_URL" == *"globepick-legal"* ]]; then
        echo "🚀 推送到 GitHub..."
        git push -u origin main 2>/dev/null || git push -u origin master 2>/dev/null || {
            echo "⚠️  推送失败，请手动推送"
            echo "💡 提示: 使用 'git push -u origin main' 或 'git push -u origin master'"
            exit 1
        }
        echo "✅ 推送成功！"
    else
        echo "⚠️  远程仓库不是 globepick-legal，跳过推送"
        echo "💡 如果要推送到新仓库，请先设置远程仓库："
        echo "   git remote add origin https://github.com/ly692600o-blip/globepick-legal.git"
    fi
else
    echo "📡 未找到远程仓库"
    echo ""
    echo "💡 下一步操作："
    echo ""
    echo "1. 在 GitHub 创建新仓库 'globepick-legal'（必须是公开仓库）"
    echo "2. 添加远程仓库："
    echo "   git remote add origin https://github.com/ly692600o-blip/globepick-legal.git"
    echo "3. 推送文件："
    echo "   git push -u origin main"
    echo ""
    echo "或者使用 HTTPS（需要 GitHub Token）："
    echo "   git remote add origin https://<TOKEN>@github.com/ly692600o-blip/globepick-legal.git"
    echo ""
fi

echo ""
echo "✅ 脚本执行完成！"
echo ""
echo "📝 下一步："
echo "1. 如果已推送，请访问 GitHub 仓库"
echo "2. 打开 Settings → Pages"
echo "3. Source 选择 'Deploy from a branch'"
echo "4. Branch 选择 'main'（或 'master'）"
echo "5. Folder 选择 '/ (root)'"
echo "6. 点击 Save"
echo ""
echo "🔗 部署完成后，链接将是："
echo "   https://ly692600o-blip.github.io/globepick-legal/privacy-policy.html"
echo "   https://ly692600o-blip.github.io/globepick-legal/terms-of-service.html"






