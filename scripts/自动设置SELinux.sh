#!/system/bin/sh

# 检查间隔时间（秒）
CHECK_INTERVAL=10

while true
do
    # 获取当前SELinux状态并清理输出
    CURRENT_STATE=$(getenforce | tr -d '[:space:]')
    
    # 判断是否需要强制执行Enforcing模式
    if [ "$CURRENT_STATE" != "Enforcing" ]; then
        setenforce 1
        echo "SELinux状态已从 $CURRENT_STATE 强制设置为 Enforcing"
    fi
    
    sleep $CHECK_INTERVAL
done