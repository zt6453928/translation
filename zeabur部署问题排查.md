# Zeabur 部署问题排查和解决方案

## 📋 你遇到的问题分析

从你提供的 Zeabur 构建日志来看：

```
#6 [2/6] WORKDIR /app
#6 DONE 4.3s
```

构建在这一步就停止了，这通常意味着：

1. **构建超时** - Zeabur 免费版有构建时间限制
2. **内存不足** - LibreTranslate 安装时需要较多内存
3. **依赖安装失败** - pip install 步骤可能卡住或失败

## ✅ 我已经做的优化

### 1. **优化 Dockerfile**
```dockerfile
# 添加了更多系统依赖
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 升级 pip 工具链
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# 增加安装超时时间
RUN pip install --no-cache-dir --timeout=300 -r requirements.txt

# 添加健康检查
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:5000/languages || exit 1
```

### 2. **优化 app.py**
```python
# 支持 Zeabur 的 PORT 环境变量
port = int(os.getenv('PORT', os.getenv('LT_PORT', '5000')))

# 延迟导入，避免启动时内存峰值
from libretranslate.main import main
```

### 3. **简化 requirements.txt**
- 移除了 `gunicorn`（Zeabur 不需要）
- 保留核心依赖

## 🔧 推送更新后的部署步骤

### 步骤 1：推送修改到 GitHub

**使用 GitHub Desktop**：
1. 打开 GitHub Desktop
2. 选择 translation 仓库
3. 查看修改的文件
4. Commit 并 Push

**或使用终端**：
```bash
cd /Users/enithz/Desktop/translation
git add .
git commit -m "Fix Zeabur deployment - optimize Docker and dependencies"
git push
```

### 步骤 2：在 Zeabur 重新部署

1. 访问你的 Zeabur 项目
2. 点击服务名称
3. 点击右上角的 "⋮" 菜单
4. 选择 "Redeploy"
5. 等待重新部署（5-10 分钟）

### 步骤 3：监控部署日志

在 Zeabur 中：
1. 点击 "Logs" 标签
2. 查看实时构建日志
3. 等待看到 "Running on http://..." 表示成功启动

## 🆘 如果仍然失败的解决方案

### 方案 A：使用 Railway 替代 Zeabur

Railway 对 LibreTranslate 的支持可能更好：

1. 访问 https://railway.app
2. 使用 GitHub 登录
3. "New Project" → "Deploy from GitHub repo"
4. 选择 zt6453928/translation
5. Railway 会自动部署

Railway 配置：
- Build Command: `pip install -r requirements.txt`
- Start Command: `python app.py`
- 自动设置 PORT 环境变量

### 方案 B：使用 Render

1. 访问 https://render.com
2. "New" → "Web Service"
3. 连接 GitHub 仓库 zt6453928/translation
4. 设置：
   - Environment: Python 3
   - Build Command: `pip install -r requirements.txt`
   - Start Command: `python app.py`
   - Instance Type: Free

### 方案 C：简化 LibreTranslate

如果内存限制是问题，可以创建一个更轻量的翻译服务：

1. 使用 Google Translate API（免费额度）
2. 使用 DeepL API（免费 500k 字符/月）
3. 使用阿里云翻译 API

## 💰 成本考虑

### Zeabur
- 免费版：有限制，可能无法运行 LibreTranslate
- 付费版：$5/月起，应该足够

### Railway
- 免费版：$5 credit/月，通常足够个人使用
- 付费版：按使用量计费

### Render
- 免费版：512MB RAM，可能不够
- Starter：$7/月，1GB RAM

## 🎯 推荐方案

**对于 LibreTranslate**：
1. **首选 Railway** - 对 Python 应用支持好，免费额度充足
2. **备选 Zeabur 付费版** - 如果愿意付费
3. **备选 Render Starter** - 稳定但需付费

**对于预算有限**：
考虑使用免费的翻译 API 服务而不是自建

## 📝 修改摘要

已优化的文件：
- ✅ `Dockerfile` - 增加依赖和超时设置
- ✅ `app.py` - 支持 Zeabur PORT 环境变量
- ✅ `requirements.txt` - 简化依赖

## 🚀 立即行动

1. **推送修改到 GitHub**（使用上面的方法）
2. **在 Zeabur 重新部署**
3. **如果仍失败，考虑切换到 Railway**

需要我帮你创建 Railway 或 Render 的配置文件吗？
