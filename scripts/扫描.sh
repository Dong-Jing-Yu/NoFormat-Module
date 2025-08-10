#!/system/bin/sh

# 目标文件名（你可以根据需要自行添加）
TARGETS="rm dd"

# 需要扫描的目录（不递归）
DIRS="
/data/user/0/bin.mt.plus/files/term/bin
/data/data/com.termux/files/usr/bin
/product/bin
/apex/com.android.runtime/bin
/apex/com.android.art/bin
/system_ext/bin
/system/bin
/system/xbin
/odm/bin
/vendor/bin
"

echo "🔍 正在扫描指定工具..."

for DIR in $DIRS; do
    if [ -d "$DIR" ]; then
        # echo "📁 扫描目录: $DIR"
        for FILE in $TARGETS; do
            if [ -f "$DIR/$FILE" ]; then
                echo "✅ 找到: $DIR/$FILE"
            fi
        done
    else
        echo "⚠️ 目录不存在: $DIR"
    fi
done

echo "🎉 扫描完成！"
