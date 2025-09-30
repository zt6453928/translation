#!/bin/bash

echo "📦 Preparing to upload LibreTranslate service to GitHub"
echo "Repository: https://github.com/zt6453928/translation.git"
echo "=" $(printf '=%.0s' {1..50})

# 检查是否在正确的目录
if [ ! -f "app.py" ]; then
    echo "❌ Error: Please run this script from the translation directory"
    exit 1
fi

# 初始化 Git 仓库
echo ""
echo "🔧 Initializing Git repository..."
git init

# 添加 .gitignore
if [ ! -f ".gitignore" ]; then
    cat > .gitignore << 'EOF'
# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# Virtual Environment
venv/
ENV/
env/
.venv

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# LibreTranslate
db/
.local/

# Logs
*.log
EOF
fi

# 添加所有文件
echo "📝 Adding files..."
git add .

# 提交
echo "💾 Committing changes..."
git commit -m "Initial commit: LibreTranslate cloud service for Musa browser

Features:
- Python-based LibreTranslate service
- Ready for Zeabur deployment
- Docker support
- API testing scripts
- Comprehensive documentation"

# 设置远程仓库
echo "🔗 Setting remote repository..."
git remote add origin https://github.com/zt6453928/translation.git

# 创建 main 分支
echo "🌿 Creating main branch..."
git branch -M main

# 推送到 GitHub
echo ""
echo "🚀 Pushing to GitHub..."
echo "⚠️  You may need to enter your GitHub username and Personal Access Token"
echo "   (Not your password - use a token from https://github.com/settings/tokens)"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Successfully uploaded to GitHub!"
    echo "🌐 Repository: https://github.com/zt6453928/translation"
    echo ""
    echo "📋 Next steps:"
    echo "1. Visit https://zeabur.com"
    echo "2. Create a new project"
    echo "3. Select 'Deploy from GitHub'"
    echo "4. Choose the 'translation' repository"
    echo "5. Wait for deployment to complete"
    echo ""
    echo "📖 For detailed deployment instructions, see DEPLOY.md"
else
    echo ""
    echo "❌ Upload failed. Please check:"
    echo "1. You have access to the repository"
    echo "2. You're using a valid Personal Access Token"
    echo "3. The repository exists on GitHub"
    echo ""
    echo "📖 For help, see UPLOAD_INSTRUCTIONS.md"
fi
