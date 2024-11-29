#!/usr/bin/python3
# SPDX-FileCopyrightText: 2024 Satoshi Ono <s23C1035NN@s.chibakoudai.jp>
# SPDX-License-Identifier: BSD-3-Clause

import sys

def greet_by_time():
    while True:
        # 標準エラー出力でプロンプトを表示
        print("現在時刻を入力してください（例: 18:00）: ", file=sys.stderr, end="")
        time_input = input()

        if not time_input or ':' not in time_input:
            print("無効な時刻形式です。例: 18:00", file=sys.stderr)
            sys.exit(1)

        try:
            hour, minute = map(int, time_input.split(':'))
        except ValueError:
            print("時刻は数値で入力してください。例: 18:00", file=sys.stderr)
            sys.exit(1)

        if not (0 <= hour < 24 and 0 <= minute < 60):
            print("時刻が無効です。", file=sys.stderr)
            sys.exit(1)

        if hour >= 18 or hour < 4:
            print("こんばんは")
        elif 4 <= hour < 10:
            print("おはようございます")
        elif 10 <= hour < 18:
            print("こんにちは")
        
        sys.exit(0)

if __name__ == "__main__":
    greet_by_time()

