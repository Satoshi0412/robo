# 挨拶コマンド
時間に応じた挨拶を返してくれるプログラム

[![test](https://github.com/Satoshi0412/robosys2024/actions/workflows/test.yml/badge.svg)](https://github.com/Satoshi0412/robosys2024/actions/workflows/test.yml)

## 実行方法
* GitHubのアカウントがない場合はHTTPSを使用
~~~
git clone https://github.com/Satoshi0412/robosys2024.git  
cd tmp/robosys2024
~~~

* GitHubのアカウントがある場合はGitHubリポジトリからクローンしてインストー
ルする。  
~~~
git clone git@github.com:Satoshi0412/robosys2024.git  
cd tmp/robosys2024  
~~~

* `aisatsukomando`スクリプトを実行可能にする
~~~
chmod +x aisatsukomando
~~~

* 以下のコードを入力し、実行する。  
~~~
./aisatsukomando 〇〇:〇〇   
〇〇には時刻を入力
~~~

## 使用方法
* 各時間を入力する例  
`$./aisatsukomando 9:00`  
・出力結果: おはようございます  
`$./aisatsukomando 12:00`  
・出力結果: こんにちは  
`$,.aisatsukomando 18:00`  
・出力結果: こんばんは  

* 時間以外を入力した場合  
`$./aisatsukomando あ`  
・出力結果: 無効な時刻形式です。例 18:00  
`$./aisatsukomando`    
・出力結果: 使用方法: `./aisatsukomando HH:MM`

## 実行結果
* 実行後、以下のような指示が出てくるので、指示に従い時刻を入力する。  
`現在時刻を入力してください（例: 18:00）:`
1. 18:00~3:59を入力した場合、「こんばんは」
2. 4:00~9:59を入力した場合、「おはようございます」
3. 10:00~17:59を入力した場合、「こんにちは」  
上記のような出力が行われる。
* 無効な時刻(0:70など)を入力した場合は以下のような指示が出てくるので、指示に従い再度時刻を入力する。
`無効な時間形式です。(例 18:00)`
* 空白や、24時を超える入力をした場合も再度時刻を入力する。

## 必要なソフトウェア
* python(テスト済みバージョン：3.7~3.11)

## テスト環境
Ubuntu 22.04

## 参考資料
* 繰り返しのユーザー入力のテスト
https://stackoverflow.com/questions/61938836/python3-testing-repeated-user-input
* input()関数の公式ドキュメント
https://docs.python.org/3/library/functions.html#input

## ライセンス
* このソフトウェアパッケージは、３条項BSDライセンスの下、再頒布および使用が許可されます。
* このパッケージのコードの一部は, 下記のスライド（CC-BY-SA 4.0 by ryuichi ueda）のものを, 本人の許可を得て自身の著作としたものです。  
* https://github.com/ryuichiueda/slides_marp/tree/master/robosys2024
* © 2024 Satoshi Ono
