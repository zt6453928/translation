# 使用 Python 3.12 作为基础镜像
FROM python:3.12-slim

# 设置工作目录
WORKDIR /app

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# 复制依赖文件
COPY requirements.txt .

# 安装 Python 依赖
RUN pip install --no-cache-dir -r requirements.txt

# 复制应用代码
COPY app.py .

# 暴露端口
EXPOSE 5000

# 设置环境变量
ENV LT_PORT=5000
ENV LT_HOST=0.0.0.0
ENV LT_CHAR_LIMIT=5000
ENV LT_REQ_LIMIT=1000

# 启动应用
CMD ["python", "app.py"]
