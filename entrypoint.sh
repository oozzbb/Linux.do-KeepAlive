#!/bin/sh

# 启用错误检测
set -e

# 定义错误处理函数
error_handler () {
    echo "[$(date +'% Y-% m-% d % H:% M:% S')] [ERROR] 脚本在第 ${LINENO} 行发生错误"
    exit 1
}

# 捕获 ERR 信号，调用错误处理函数
trap 'error_handler' ERR

# 校验环境变量参数，对部分必要参数进行校验
if [ -z $LINUXDO_USERNAME ]; then
    echo "[$(date +'% Y-% m-% d % H:% M:% S')] [ERROR] 缺少 LINUXDO_USERNAME"
    exit 1
fi

if [ -z $LINUXDO_PASSWORD ]; then
    echo "[$(date +'% Y-% m-% d % H:% M:% S')] [ERROR] 缺少 LINUXDO_PASSWORD"
    exit 1
fi

if [ -n $CRON_RULE ]; then
    echo "$CRON_RULE /app/entrypoint.sh 2>&1" > /var/spool/cron/crontabs/root
fi

python Linux.do.py

exec "$@"
