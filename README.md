# LibreTranslate Cloud Service

这是一个部署在 Zeabur 云端的 LibreTranslate 翻译服务。

## 功能特性

- 🌐 开源免费的机器翻译服务
- 🔒 完全私有，保护数据隐私
- 🚀 支持多种语言互译
- ⚡ 快速响应，低延迟
- 🎯 兼容 LibreTranslate API

## 支持的语言

支持 100+ 种语言，包括但不限于：
- 英语 (English)
- 中文 (Chinese)
- 日语 (Japanese)
- 韩语 (Korean)
- 法语 (French)
- 德语 (German)
- 西班牙语 (Spanish)
- 更多...

## API 使用

### 翻译文本

```bash
curl -X POST "https://your-service-url/translate" \
  -H "Content-Type: application/json" \
  -d '{
    "q": "Hello, World!",
    "source": "en",
    "target": "zh",
    "format": "text"
  }'
```

### 获取支持的语言列表

```bash
curl "https://your-service-url/languages"
```

### 自动检测语言

```bash
curl -X POST "https://your-service-url/detect" \
  -H "Content-Type: application/json" \
  -d '{
    "q": "Hello, World!"
  }'
```

## 部署到 Zeabur

1. Fork 此仓库
2. 在 [Zeabur](https://zeabur.com) 创建新项目
3. 选择 GitHub 仓库
4. Zeabur 会自动检测并部署

## 环境变量配置

可以在 Zeabur 中配置以下环境变量：

- `LT_PORT`: 服务端口（默认：5000）
- `LT_HOST`: 监听地址（默认：0.0.0.0）
- `LT_CHAR_LIMIT`: 字符限制（默认：5000）
- `LT_REQ_LIMIT`: 请求限制（默认：1000）
- `LT_API_KEYS`: API 密钥（可选，用于限制访问）

## 本地开发

```bash
# 安装依赖
pip install -r requirements.txt

# 启动服务
python app.py
```

## 技术栈

- [LibreTranslate](https://github.com/LibreTranslate/LibreTranslate) - 开源翻译引擎
- Python 3.12+
- Flask Web 框架
- Zeabur 云平台

## 许可证

MIT License

## 相关链接

- [LibreTranslate 官方文档](https://libretranslate.com/docs)
- [Zeabur 文档](https://zeabur.com/docs)
- [API 参考](https://libretranslate.com/docs#api)

## 贡献

欢迎提交 Issue 和 Pull Request！

## 联系方式

如有问题，请通过 GitHub Issues 联系。
