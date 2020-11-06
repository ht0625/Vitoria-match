# README

# Vitoria-match

## 概要
Vitoria-matchはサッカーチームへ向けたアプリです。
多くのチームは公式試合で『勝つ』ために、日々練習試合を行っています。
練習試合は実戦形式のためレベルアップするには最も有効な練習であると言われています。
しかし、練習試合を組めたは良いが試合をしてみたら対戦相手の「特徴」が想定していたものと異なり
自分たちの戦術練習がうまく試せないで終わってしまったなんて事もあると思います。

本アプリでは最良な対戦相手と練習試合のマッチングを可能にします。
練習試合の募集に対しチームの「特徴」で絞り込むことができ、効率よく練習試合の対戦相手を探すことができます。

## コンセプト
「特徴」で決める練習試合のマッチングアプリ

## バージョン
Ruby 2.6.5
Rails 5.2.4

## 機能一覧
- ユーザー登録・編集・削除機能
- チーム登録・編集・削除機能
- ログイン・ログアウト機能
- 練習試合募集登録・編集・削除機能
- 練習試合募集一覧表示機能
- 練習試合募集検索機能
- チームの代表者同士のメッセージ機能

## カタログ設計
https://docs.google.com/spreadsheets/d/1zzqUUktQHLwhF8ZbDbESJonUgYUjsISGzYl0WaqazDA/edit?usp=sharing

## テーブル定義・ER図・画面遷移図・画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1_tWGMHK5yoYYcIaq7f-kMKD2cesZEjTSwposoM7n_Hk/edit?usp=sharing


## 使用Gem
* devise
* ransack
* kaminari
* rails_admin
* cancancan
* bulma-rails
