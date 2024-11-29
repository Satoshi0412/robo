#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Satoshi Ono <s23C1035NN@s.chibakoudai.jp>
# SPDX-License-Identifier: BSD-3-Clause

import sys

def greet_by_time():
    while True:
        # 標準エラー出力でプロンプトを表示
        print("現在時刻を入力してください（例: 18:00）: ", file=sys.stderr, end="")
        time_input = input()

        # 無効な時刻形式の確認
        if not time_input or ':' not in time_input:
            print("無効な時刻形式です。例: 18:00", file=sys.stderr)
            continue  # 再入力を求める

        try:
            # 入力を時と分に分解
            hour, minute = map(int, time_input.split(':'))
        except ValueError:
            print("時刻は数値で入力してください。例: 18:00", file=sys.stderr)
            continue  # 再入力を求める

        # 時刻が範囲外の場合
        if not (0 <= hour < 24 and 0 <= minute < 60):
            print("時刻が無効です。", file=sys.stderr)
            continue  # 再入力を求める

        # 挨拶を決定
        if hour >= 18 or hour < 4:  # 18:00〜3:59
            print("こんばんは")
        elif 4 <= hour < 10:       # 4:00〜9:59
            print("おはようございます")
        elif 10 <= hour < 18:      # 10:00〜17:59
            print("こんにちは")
        
        # 正常に終了
        break

if __name__ == "__main__":
    greet_by_time()

