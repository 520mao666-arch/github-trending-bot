#!/bin/bash
# GitHub Actions 定时推送脚本

WEBHOOK="https://open.feishu.cn/open-apis/bot/v2/hook/e26846ad-c489-4e2d-bc70-a9f18b55942c"

TODAY=$(date "+%Y-%m-%d")
WEEKDAY=$(date "+%u")

# 构建消息
MESSAGE="🐱 GitHub 趋势精选 $TODAY

🔥 前端/后端热门项目
1. [tanstack/query](https://github.com/TanStack/query) ⭐9800 - Powerful async state management
2. [oven-sh/bun](https://github.com/oven-sh/bun) ⭐95000 - Incredibly fast JS runtime  
3. [vercel/next.js](https://github.com/vercel/next.js) ⭐115000 - React framework for production

🏷️ 数据标注相关
1. [label-studio](https://github.com/heartexlabs/label-studio) ⭐13500 - Open source data labeling tool
2. [labelImg](https://github.com/tzutalin/labelImg) ⭐28000 - Image annotation tool"

# 周六添加热门话题
if [ "$WEEKDAY" = "6" ]; then
  MESSAGE="$MESSAGE

📰 本周热门科技话题
1. AI Agent 持续火热，各厂商纷纷布局
2. Rust 在系统编程领域势头强劲
3. Web3 和区块链技术持续演进
4. 低代码平台受到更多关注"
fi

MESSAGE="$MESSAGE

⏰ 推送时间: $(date "+%Y-%m-%d %H:%M")"

# 发送到飞书
curl -X POST "$WEBHOOK" \
  -H "Content-Type: application/json" \
  -d "{\"msg_type\":\"text\",\"content\":{\"text\":\"$MESSAGE\"}}"
