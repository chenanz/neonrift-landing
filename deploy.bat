@echo off
chcp 65001 >nul
echo ===== 正在部署到 GitHub Pages =====
echo.

set SRC=D:\风\hermes\neonrift-premium
set TMP=D:\neonrift-deploy-tmp

echo [1/4] 克隆仓库...
if exist "%TMP%" rmdir /s /q "%TMP%"
git clone --depth=1 https://github.com/chenanz/neonrift-landing.git "%TMP%"
if errorlevel 1 goto fail

echo [2/4] 清空旧文件...
cd /d "%TMP%"
del /q *.* 2>nul
for /d %%x in (*) do rmdir /s /q "%%x" 2>nul

echo [3/4] 复制新文件...
xcopy /s /e /y "%SRC%\*" "%TMP%\" >nul

echo [4/4] Git 提交...
git add -A
git commit -m "deploy: neonrift premium v2"
git push origin main
if errorlevel 1 goto fail

echo.
echo ===== 部署成功！=====
echo 等1分钟后访问：https://chenanz.github.io/neonrift-landing
pause
exit /b 0

:fail
echo.
echo ===== 部署失败 =====
echo 检查网络或手动执行 git push
pause
exit /b 1
