#!/bin/bash

# 立即推送到已存在的 GitHub 仓库

cd "/Users/liuyang/Desktop/拾物GlobePick_备份_20251210/website"

echo "🚀 准备推送到 GitHub 仓库：globepick-legal"
echo ""

# 确保远程仓库已配置
if ! git remote get-url origin >/dev/null 2>&1; then
    echo "📡 添加远程仓库..."
    git remote add origin https://github.com/ly692600o-blip/globepick-legal.git
else
    echo "✅ 远程仓库已配置: $(git remote get-url origin)"
    # 更新远程 URL（如果需要）
    git remote set-url origin https://github.com/ly692600o-blip/globepick-legal.git
fi

# 确保分支是 main
git branch -M main 2>/dev/null || true

echo ""
echo "📤 开始推送文件..."
echo ""

# 推送文件
git push -u origin main 2>&1

echo ""
echo "✅ 推送完成！"
echo ""
echo "📝 下一步："
echo "1. 访问仓库: https://github.com/ly692600o-blip/globepick-legal"
echo "2. 打开 Settings → Pages"
echo "3. Source 选择 'Deploy from a branch'"
echo "4. Branch 选择 'main'"
echo "5. Folder 选择 '/ (root)'"
echo "6. 点击 Save"
echo ""
echo "🔗 部署完成后，链接将是："
echo "   https://ly692600o-blip.github.io/globepick-legal/privacy-policy.html"
echo "   https://ly692600o-blip.github.io/globepick-legal/terms-of-service.html"






