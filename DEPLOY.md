# 部署指南

## 部署到 Zeabur

### 步骤 1：准备 GitHub 仓库

1. 将此项目推送到你的 GitHub 仓库：
```bash
git init
git add .
git commit -m "Initial commit: LibreTranslate service"
git remote add origin https://github.com/zt6453928/translation.git
git push -u origin main
```

### 步骤 2：在 Zeabur 部署

1. 访问 [Zeabur](https://zeabur.com)
2. 点击 "New Project"
3. 选择 "Deploy from GitHub"
4. 选择 `translation` 仓库
5. Zeabur 会自动检测并部署

### 步骤 3：配置环境变量（可选）

在 Zeabur 项目设置中，可以配置以下环境变量：

| 变量名 | 默认值 | 说明 |
|--------|--------|------|
| `LT_PORT` | 5000 | 服务端口 |
| `LT_HOST` | 0.0.0.0 | 监听地址 |
| `LT_CHAR_LIMIT` | 5000 | 单次翻译字符数限制 |
| `LT_REQ_LIMIT` | 1000 | 请求速率限制 |
| `LT_API_KEYS` | 无 | API 密钥（用于限制访问） |

### 步骤 4：获取服务 URL

部署完成后，Zeabur 会提供一个服务 URL，类似：
```
https://your-service.zeabur.app
```

### 步骤 5：测试服务

```bash
# 测试翻译接口
curl -X POST "https://your-service.zeabur.app/translate" \
  -H "Content-Type: application/json" \
  -d '{
    "q": "你好，世界！",
    "source": "zh",
    "target": "en",
    "format": "text"
  }'

# 测试语言列表
curl "https://your-service.zeabur.app/languages"
```

## 更新 Musa 配置

部署完成后，在 Musa 浏览器中更新翻译服务地址：

1. 打开 `Musa/TranslationManager.swift`
2. 修改 `translateServiceURL` 为你的 Zeabur 服务地址：
```swift
private let translateServiceURL = "https://your-service.zeabur.app"
```

3. 重新编译并运行 Musa

## 其他部署选项

### 部署到 Railway

1. 访问 [Railway](https://railway.app)
2. 选择 "Deploy from GitHub"
3. 选择此仓库
4. Railway 会自动部署

### 部署到 Render

1. 访问 [Render](https://render.com)
2. 选择 "New Web Service"
3. 连接 GitHub 仓库
4. 设置：
   - Build Command: `pip install -r requirements.txt`
   - Start Command: `python app.py`

### 部署到 Heroku

```bash
# 安装 Heroku CLI
heroku login

# 创建应用
heroku create your-app-name

# 部署
git push heroku main

# 查看日志
heroku logs --tail
```

## 监控和维护

### 查看日志

在 Zeabur 控制台中可以查看实时日志。

### 扩展性能

如果需要处理更多请求，可以在 Zeabur 中：
1. 升级到更高的计划
2. 启用自动扩展
3. 增加内存和 CPU 配置

### 安全建议

1. 设置 `LT_API_KEYS` 限制访问
2. 启用 HTTPS（Zeabur 默认提供）
3. 设置合理的速率限制
4. 定期更新依赖包

## 成本估算

- Zeabur 免费版：每月 $0，有使用限制
- Zeabur 付费版：从 $5/月起，无限制使用

## 故障排查

### 部署失败

1. 检查 `requirements.txt` 是否正确
2. 查看 Zeabur 部署日志
3. 确保 Python 版本兼容（3.12+）

### 服务无响应

1. 检查服务状态
2. 查看错误日志
3. 验证环境变量配置

### 翻译质量问题

LibreTranslate 使用开源模型，翻译质量可能不如商业服务。可以考虑：
1. 更新到最新版本
2. 使用更大的模型
3. 针对特定语言对优化

## 支持

如有问题，请通过以下方式获取帮助：
- [LibreTranslate 官方文档](https://libretranslate.com/docs)
- [Zeabur 文档](https://zeabur.com/docs)
- [GitHub Issues](https://github.com/zt6453928/translation/issues)
