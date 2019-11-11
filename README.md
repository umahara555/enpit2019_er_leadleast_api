# LeadLeast

## エレベーターピッチ

オンラインで学習しながらプロダクトデザインしたい、  
enPiT受講中の生徒向けの、  
LeadLeastというプロダクトは、  
プロダクトダクトデザイン学習支援サービスです。  
これは、ブラウザ上でリーンキャンパスやユーザーストーリマップを作る事ができ、  
GuildHubや他のプロダクトデザインツールとは違い、  
学びながら作る事ができ、また、実際の付箋を使っているような感覚で使う事ができます。  

## リポジトリ

- [フロントエンド](https://github.com/umahara555/enpit2019_er_leadleast_front)
- [バックエンド](https://github.com/umahara555/enpit2019_er_leadleast_api)

## セットアップ

#### GitHubから取ってくる

```
$ git clone https://github.com/umahara555/enpit2019_er_leadleast.git
$ cd enpit2019_er_leadleast_api
$ cp .env.sample .env
```

#### ビルド
```
$ docker-compose build
```

#### 起動
```
$ docker-compose up -d
```

#### DBへ設定
```
$ docker-compose exec db /bin/bash
$ psql -U postgres -c "CREATE ROLE leadleast WITH LOGIN PASSWORD '' CREATEDB;"
$ exit
```

#### データベースの作成とマイグレーション
```
$ docker-compose run api bundle exec rails db:create
$ docker-compose run api bundle exec rails db:migrate
```

１分前後待った後、ブラウザで`localhost:5000`にアクセスできたらOK!

## 使い方

```
# ライブラリ等の追加や更新があった時
$ docker-compose build

# 起動
$ docker-compose up -d

# 終了
docker-compose down
```

