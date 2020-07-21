# :cake: :fries: Healet :fork_and_knife: :pizza:

体重、食べた物を記録したり、<br>
他のユーザーとダイエットや健康・美容に関して情報をシェア出来るアプリです。
<br>
<br>

## :question: なぜ作ったのか

家にいる時間が多くなり、結果増えた体重を元に戻すため&食生活の改善をするために作成しました。<br>
毎日使うためシンプルで使いやすいアプリを目指しました。
<br>
<br>

## :globe_with_meridians: URL
http://54.249.220.113
<br>
<br>

## :eyes: DEMO
<img src="https://user-images.githubusercontent.com/61342566/87900728-2ac6e280-ca90-11ea-832c-98026aeac5ec.png" width=70%>
<img src="https://user-images.githubusercontent.com/61342566/87900730-2dc1d300-ca90-11ea-868b-e768e1bbfc49.png" width=70%>
<img src="https://user-images.githubusercontent.com/61342566/87900837-711c4180-ca90-11ea-91a8-8b7c89ade21a.png" width=70%>
<img src="https://user-images.githubusercontent.com/61342566/87900838-72e60500-ca90-11ea-95ae-5ff42138db60.png" width=70%>
<br>
<br>

## :wrench: 使用技術(開発環境)
### フロントエンド
* HTML
* CSS
* JavaScript
* jQuery

### バックエンド
* Ruby 2.5.1
* Rails 5.2.4.3

### インフラストラクチャー
* Mysql
* Nginx
* AWS
    - CloudWatch
    - EC2
    - RDS
    - VPC

## 機能一覧

* ユーザー関連
    * 新規登録、ログイン、ログアウト
* 体重
    * 体重の記録・編集・削除
    * グラフ表示
* 食べ物
    * 食べ物の記録・編集・削除
* 掲示板
    * 記事の投稿・編集・削除
* タグ
    * 記事とタグを登録
    * タグ一覧ページ
* いいね
    * いいね一覧ページ

## :point_up: 工夫したポイント
今まで使用したことのないgemやプラグインを積極的に使用。
- JavaScriptのチャートライブラリである[Chart.js](https://www.chartjs.org/)を使用。
- タグのフロントエンド部分は、jQueryプラグイン[tag-it](https://github.com/aehlke/tag-it)を使用。
- トップページの背景画像スライドショー機能は、jQueryプラグイン[bgswitcher](https://github.com/rewish/jquery-bgswitcher)を使用。

## :pencil: 課題や今後実装したい機能
・UIの部分をよりユーザーが快適に使えるようにいくつか修正したいです。<br>
例：<br>
- 体重や食事記録投稿はページ遷移せずモーダルウィンドウが出てきて投稿出来るようにしたいです。<br>
- グラフの表示をplugin等を使用し、もう少し工夫してより使いやすくしたいです。<br>



