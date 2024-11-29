#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Satoshi Ono <s23C1035NN@s.chibakoudai.jp>
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "${1}行目が違うよ"
    res=1
}

res=0

### 正常動作 ###
# 18:00の入力に対する期待される出力
out=$(echo "18:00" | ./kadai1.py)
[ "${out}" = "こんばんは" ] || ng "$LINENO"

# 08:00の入力に対する期待される出力
out=$(echo "08:00" | ./kadai1.py)
[ "${out}" = "おはようございます" ] || ng "$LINENO"

# 14:00の入力に対する期待される出力
out=$(echo "14:00" | ./kadai1.py)
[ "${out}" = "こんにちは" ] || ng "$LINENO"

### 異常動作 ###
# 無効な時刻形式（例: "あ"）に対するエラー処理
out=$(echo "あ" | ./kadai1.py 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"

# 空の入力に対するエラー処理
out=$(echo "" | ./kadai1.py 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"

# 24時間を超える無効な時刻（例: "25:00"）
out=$(echo "25:00" | ./kadai1.py 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit "$res"

