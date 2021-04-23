# アプリケーション名
Climbing-App

# アプリケーションの概要
クライミングジムの情報の投稿•閲覧•編集•削除
外岩の情報の投稿•閲覧•編集•削除
外岩の課題情報の投稿•閲覧•削除
グループ機能(500円を支払うとSlackに招待する)

# URL
http://52.194.94.94/

# テスト用アカウント
Email:test@test.com
Password:test11

# 購入用カードの番号・期限・セキュリティコード
カードの番号: 4242424242424242
期限: 3/23
セキュリティコード:123

# 利用方法
トップページからLoginボタンからログインすることができる。
トップページから「ジム情報投稿」と「岩情報投稿」ができる。
## ジム情報について
投稿が完了すると「ジム情報投稿」をした場合はトップページのGymから投稿したものの一覧を表示できる。

一覧表示から投稿したものをクリックすると投稿したものの詳細を見ることができる

詳細ページの下の方へ行くと住所から割り当てられた場所をGoogleMapにピンを建てる実装をしている

## 岩情報について
「岩情報投稿」を完了するとトップページのRockから投稿したものの一覧を表示できる

一覧表示から投稿したものをクリックすると投稿したものの詳細を見ることができる

詳細ページの下の方へ行くと住所から割り当てられた場所をGoogleMapにピンを建てる実装をしている

詳細ページの下の方へ行くと岩の課題情報の投稿ができる

投稿が完了すると岩情報詳細ページの下に「岩情報の課題」の一覧表示される

「岩情報の課題」の一覧から投稿したものをクリックすると「岩課題情報」の詳細を見ることが出来る

投稿する際にYouTubeのリンクを貼ってもらうと詳細ページに投稿したリンクのYouTubeの動画を見ることが出来る

## グループ機能について
トップページのGroupからGroupについての説明に行くことが出来る

Joinから購入ページに行くことが出来る

購入ができるとSlackへのURLが表示される

## Slackについて
Slackでは情報の共有•一緒に登る仲間を募集したり•登る上で質問などを聞くことができる

# 目指した課題解決
1.「クライミングの情報をもっと知りたい！」と思った人の問題を解決したいと思った

2.コミュニティという輪を創ることで、「登りたいんだけど、一人で登るのは嫌だな」という人の課題を解決したいと思った

3.クライミングをする人は一人で登りたい人もいれば•複数人で登りたい人もいる、そこで人の少ない日や時間帯を投稿できるようにした

4.クライミングをする人はオンサイト（他の人が登っている動画を見ずに、また実際に登っている姿を見ずに、下見のみで落ちずに一発で登ること）を重視している方もいるので写真のみで実際に登るラインだけを見れるようにした

5.オンサイトを気にしない（動画とか見てもいい）という人もいるのでYouTubeの動画を見れるようにした

6.実際にその岩やジムが住所だけではGoogleMapsなどでまた検索をしないといけないのでGoogleMapsの表示し住所から割り当てられた場所をピンを打った実装を行いました

# 洗い出した要件
ジム情報
岩情報
岩課題情報
グループ機能

# 実装した機能についての画像やGIFおよびその説明
<!-- ジム情報 -->
1.ジム情報を投稿し一覧表示ができている動画
[![Image from Gyazo](https://i.gyazo.com/ec966b2687db47401f6cf6a71a5f342a.gif)](https://gyazo.com/ec966b2687db47401f6cf6a71a5f342a)

2.ジム情報の詳細が見れる動画
[![Image from Gyazo](https://i.gyazo.com/5ceb9bd56cb232d0420560eecd27ee67.gif)](https://gyazo.com/5ceb9bd56cb232d0420560eecd27ee67)

3.ジム情報の詳細ページからホームページやSNSに行ける動画
[![Image from Gyazo](https://i.gyazo.com/d6b4fa2650b7efb417ed804fa47c3094.gif)](https://gyazo.com/d6b4fa2650b7efb417ed804fa47c3094)

4.ジム情報を編集できる動画
[![Image from Gyazo](https://i.gyazo.com/b6e9a1eff9c8b5d2a66d633ba2caeb38.gif)](https://gyazo.com/b6e9a1eff9c8b5d2a66d633ba2caeb38)

5.ジム情報を削除できる動画
[![Image from Gyazo](https://i.gyazo.com/cc35f94c7faa6ccd0e55569e54dd5827.gif)](https://gyazo.com/cc35f94c7faa6ccd0e55569e54dd5827)

<!-- 岩情報 -->
1.岩情報が投稿でき一覧表示されている動画
[![Image from Gyazo](https://i.gyazo.com/ac311776fead93b3b34ac4d72142d3e7.gif)](https://gyazo.com/ac311776fead93b3b34ac4d72142d3e7)

2.岩情報を詳細が見れる動画
[![Image from Gyazo](https://i.gyazo.com/030cf0e0414eeb655e7411969f173f70.gif)](https://gyazo.com/030cf0e0414eeb655e7411969f173f70)

3.岩情報を編集出来る動画
[![Image from Gyazo](https://i.gyazo.com/b964c362e9fc47d900ed440ae2a816cb.gif)](https://gyazo.com/b964c362e9fc47d900ed440ae2a816cb)

4.岩情報を削除できる動画
[![Image from Gyazo](https://i.gyazo.com/5d7a5ca9b7198afb3ba1483ea0fae7d7.gif)](https://gyazo.com/5d7a5ca9b7198afb3ba1483ea0fae7d7)

<!-- 岩課題情報 -->
1.岩課題情報の投稿と投稿したものの一覧を見ることが出来る動画
[![Image from Gyazo](https://i.gyazo.com/a70dd3391cb5575972af621bce4aabc7.gif)](https://gyazo.com/a70dd3391cb5575972af621bce4aabc7)

2.岩課題情報の詳細が見れる＆YouTubeのリンクを張っている場合見れる動画
[![Image from Gyazo](https://i.gyazo.com/2f618a17f6972f034957e13b33dbc8bf.gif)](https://gyazo.com/2f618a17f6972f034957e13b33dbc8bf)

3.岩課題情報を削除できる動画
[![Image from Gyazo](https://i.gyazo.com/8aa5e9518e1341f2c96bb2c01716a74d.gif)](https://gyazo.com/8aa5e9518e1341f2c96bb2c01716a74d)

<!-- グループ機能 -->
1.トップページからGroupをクリックするとグループの説明のページに行ける動画
[![Image from Gyazo](https://i.gyazo.com/4ed69dc020d86b02d454f24037e4caa4.gif)](https://gyazo.com/4ed69dc020d86b02d454f24037e4caa4)

2.Joinを押すと購入ページに行ける動画
[![Image from Gyazo](https://i.gyazo.com/82ef79da42a6886b79bf3c8880a888fd.gif)](https://gyazo.com/82ef79da42a6886b79bf3c8880a888fd)

3.クレジットカードの情報をいれて購入ボタンを押すと「SlackへのURL」が表示される動画
[![Image from Gyazo](https://i.gyazo.com/e032d7827220226dd766364c00a8f0d9.gif)](https://gyazo.com/e032d7827220226dd766364c00a8f0d9)

4.「SlackへのURL」をクリックするとSlackのコミュニティページへ行ける動画
[![Image from Gyazo](https://i.gyazo.com/63fbbc9f5cbd9907a90fe9976015f3f1.gif)](https://gyazo.com/63fbbc9f5cbd9907a90fe9976015f3f1)

# 実装予定の機能
コメント機能の実装

読み込み中というのを実装したい

本番環境でGoogle Mapsの表示がされないのでそれを出来るように実装

詳細ページの見た目があまりきれいではないのでそれをかっこよくする

スマホやパソコンのサイズによってはきれいに見た目が表示されないと思うのでそれを直したい

グループ機能の説明ページの背景を自分で作った動画を背景にしてみたい

エラーメッセージを日本語化

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/11b4650a092e6f31f8a1bf0a95cb4d59.png)](https://gyazo.com/11b4650a092e6f31f8a1bf0a95cb4d59)

# ローカルでの動作方法
Ruby ver:2.6.5
Rails ver: 6.1.3.1
MySQL
Mac OS Catalina var: 10.15.7

1.git clone https://github.com/naonao-program/climbing-app1.git

2.bundle install

3.rails db:create

4.rails db:migrate