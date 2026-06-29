#!/bin/bash
# 一键部署到 chenanz.github.io/neonrift-landing
# 在 Git Bash 里跑：bash deploy.sh

SRC="/d/风/hermes/neonrift-premium"
REPO="https://github.com/chenanz/neonrift-landing.git"
TMP="/d/neonrift-deploy-tmp"

echo "==== 克隆仓库..."
rm -rf "$TMP"
git clone --depth=1 "$REPO" "$TMP"

echo "==== 清空旧文件..."
rm -rf "$TMP"/*
rm -rf "$TMP"/.* 2>/dev/null

echo "==== 复制新文件..."
cp -r "$SRC"/* "$TMP"/

cd "$TMP"

echo "==== Git 提交..."
git add -A
git commit -m "deploy: neonrift premium v2 $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main

echo "==== 完成！等1分钟访问 https://chenanz.github.io/neonrift-landing"
read -p "按回车退出"
