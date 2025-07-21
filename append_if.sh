TARGET_FILE="seven_check.py"

last_num=7

last_num=$(grep -oP '\(num == \K[0-9]+' "$TARGET_FILE" | tail -1)

next_num=$((last_num + 1))

cat <<EOF >>"$TARGET_FILE"

    elif(num == $next_num):
        return 'This is not number 7'
EOF

echo "Added num = $next_num in $TARGET_FILE"
