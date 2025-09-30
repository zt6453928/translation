# 使用 Python 3.12 作为基础镜像
FROM python:3.12-slim

# 设置工作目录
WORKDIR /app

# 安装系统依赖（LibreTranslate 需要的编译工具）
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 升级 pip
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# 复制依赖文件
COPY requirements.txt .

# 安装 Python 依赖（增加超时时间）
RUN pip install --no-cache-dir --timeout=300 -r requirements.txt

# 复制应用代码
COPY app.py .

# 暴露端口（Zeabur 会自动处理端口映射）
EXPOSE 5000

# 设置环境变量
ENV LT_PORT=5000
ENV LT_HOST=0.0.0.0
ENV LT_CHAR_LIMIT=5000
ENV LT_REQ_LIMIT=1000
ENV PYTHONUNBUFFERED=1

# 健康检查
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:5000/languages || exit 1

# 启动应用
CMD ["python", "app.py"]
