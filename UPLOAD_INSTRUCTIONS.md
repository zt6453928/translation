# 上传到 GitHub 的指令

## 方法 1：使用 GitHub Desktop（推荐，最简单）

1. 打开 GitHub Desktop
2. 点击 "File" → "Add Local Repository"
3. 选择 `/Users/enithz/Desktop/translation` 文件夹
4. 点击 "Create Repository" 
5. 填写：
   - Name: translation
   - Description: LibreTranslate cloud service for Musa browser
   - 勾选 "Initialize this repository with a README"（不勾选，我们已经有了）
6. 点击 "Create Repository"
7. 点击 "Publish repository"
8. 取消勾选 "Keep this code private"（如果想公开）
9. 点击 "Publish Repository"

## 方法 2：使用命令行

打开终端，执行以下命令：

```bash
# 进入项目目录
cd /Users/enithz/Desktop/translation

# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: LibreTranslate cloud service"

# 添加远程仓库
git remote add origin https://github.com/zt6453928/translation.git

# 推送到 GitHub（如果是首次推送，可能需要先创建 main 分支）
git branch -M main
git push -u origin main
```

如果遇到认证问题，可能需要：
1. 使用 GitHub Personal Access Token
2. 或者使用 SSH 密钥

### 使用 Personal Access Token

```bash
# 推送时，用户名输入你的 GitHub 用户名
# 密码输入 Personal Access Token（不是密码）
git push -u origin main
```

### 创建 Personal Access Token

1. 访问 https://github.com/settings/tokens
2. 点击 "Generate new token (classic)"
3. 选择权限：repo（全部）
4. 点击 "Generate token"
5. 复制 token（只显示一次）

## 方法 3：使用 GitHub 网页上传

1. 访问 https://github.com/zt6453928/translation
2. 点击 "uploading an existing file"
3. 将 `/Users/enithz/Desktop/translation` 文件夹中的所有文件拖拽到网页
4. 填写 commit 信息
5. 点击 "Commit changes"

## 验证上传成功

上传后，访问 https://github.com/zt6453928/translation 应该能看到：

```
translation/
├── .gitignore
├── README.md
├── DEPLOY.md
├── UPLOAD_INSTRUCTIONS.md
├── app.py
├── requirements.txt
├── Procfile
├── runtime.txt
├── zeabur.json
├── Dockerfile
└── test_api.sh
```

## 下一步：部署到 Zeabur

上传成功后，参考 `DEPLOY.md` 文件进行部署。
