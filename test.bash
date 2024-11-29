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
out=$(./aisatsukomando "18:00")
[ "${out}" = "こんばんは" ] || ng "$LINENO" "$out"

# 08:00の入力に対する期待される出力
out=$(./aisatsukomando "08:00")
[ "${out}" = "おはようございます" ] || ng "$LINENO" "$out"

# 14:00の入力に対する期待される出力
out=$(./aisatsukomando "14:00")
[ "${out}" = "こんにちは" ] || ng "$LINENO" "$out"

### 異常動作 ###
# 無効な時刻形式（例: "あ"）に対するエラー処理
out=$(./aisatsukomando "あ" 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO" "$out"

# 空の入力に対するエラー処理
out=$(./aisatsukomando "" 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO" "$out"

# 24時間を超える無効な時刻（例: "25:00"）
out=$(./aisatsukomando "25:00" 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO" "$out"

[ "${res}" = 0 ] && echo OK
exit "$res"

