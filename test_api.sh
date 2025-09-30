#!/bin/bash

# LibreTranslate API 测试脚本

# 设置服务地址（修改为你的实际地址）
SERVICE_URL="${1:-http://127.0.0.1:5000}"

echo "🧪 Testing LibreTranslate API"
echo "Service URL: $SERVICE_URL"
echo "=" $(printf '=%.0s' {1..50})

# 测试 1: 获取支持的语言列表
echo ""
echo "📋 Test 1: Get supported languages"
curl -s "$SERVICE_URL/languages" | python3 -m json.tool | head -20

# 测试 2: 中文到英文翻译
echo ""
echo "🇨🇳 → 🇺🇸 Test 2: Chinese to English"
curl -s -X POST "$SERVICE_URL/translate" \
  -H "Content-Type: application/json" \
  -d '{
    "q": "你好，世界！",
    "source": "zh",
    "target": "en",
    "format": "text"
  }' | python3 -m json.tool

# 测试 3: 英文到中文翻译
echo ""
echo "🇺🇸 → 🇨🇳 Test 3: English to Chinese"
curl -s -X POST "$SERVICE_URL/translate" \
  -H "Content-Type: application/json" \
  -d '{
    "q": "Hello, World!",
    "source": "en",
    "target": "zh",
    "format": "text"
  }' | python3 -m json.tool

# 测试 4: 自动检测语言
echo ""
echo "🔍 Test 4: Detect language"
curl -s -X POST "$SERVICE_URL/detect" \
  -H "Content-Type: application/json" \
  -d '{
    "q": "Bonjour le monde"
  }' | python3 -m json.tool

# 测试 5: 长文本翻译
echo ""
echo "📝 Test 5: Long text translation"
curl -s -X POST "$SERVICE_URL/translate" \
  -H "Content-Type: application/json" \
  -d '{
    "q": "LibreTranslate is a free and open source machine translation API. It is entirely self-hosted and does not rely on proprietary services.",
    "source": "en",
    "target": "zh",
    "format": "text"
  }' | python3 -m json.tool

echo ""
echo "✅ All tests completed!"
