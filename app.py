#!/usr/bin/env python3
"""
LibreTranslate Cloud Service
A cloud-based translation service powered by LibreTranslate
"""

import os
import sys
from libretranslate.main import main

if __name__ == "__main__":
    # 从环境变量读取配置，提供默认值
    port = int(os.getenv('LT_PORT', '5000'))
    host = os.getenv('LT_HOST', '0.0.0.0')
    char_limit = int(os.getenv('LT_CHAR_LIMIT', '5000'))
    req_limit = int(os.getenv('LT_REQ_LIMIT', '1000'))
    api_keys = os.getenv('LT_API_KEYS', '')
    
    # 构建命令行参数
    sys.argv = [
        'libretranslate',
        '--port', str(port),
        '--host', host,
        '--char-limit', str(char_limit),
        '--req-limit', str(req_limit),
    ]
    
    # 如果设置了 API 密钥，添加到参数中
    if api_keys:
        sys.argv.extend(['--api-keys', api_keys])
    
    # 启动 LibreTranslate
    print(f"🚀 Starting LibreTranslate on {host}:{port}")
    print(f"📊 Character limit: {char_limit}")
    print(f"🔄 Request limit: {req_limit}")
    if api_keys:
        print(f"🔐 API Keys enabled")
    print("=" * 50)
    
    main()
