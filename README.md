# README

# 食べ時
位置情報を使用して、近くにある飲食店を検索するWebアプリケーションです。

# Requirement
- Ruby 2.6.2
- Rails 6.1.3
- rbenv
- Bootstrap 4.3.1
- Geolocation API
- ホットペッパーグルメサーチ API

ホットペッパーグルメサーチ APIはリクルートWEBサービスから新規登録し、API keyを取得してください。  
[リクルートWEBサービス](https://webservice.recruit.co.jp/index.html)

# Installation
- rbenv
```bash
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
  ~/.rbenv/bin/rbenv init  # 出力される指示に従う
  source ~/.bash_profile
```

- Ruby 2.6.2
```bash
  rbenv install 2.6.2
```

- Rails 6.1.3
```bash
  gem install rails
```

- Bootstrap 4.1.3
    - Gemfileに追記
  ```text
      gem 'bootstrap', '~> 4.1.3'  
    ```
    
  - terminal
  ```bash
      bundle install
    ```
  
  - app/assets/stylesheets/application.css に以下を追記
  - ファイル名を変更: application.css → application.scss
  ```scss
      @import "bootstrap";
    ```
  
  - app/javascripts/packs/application.js　に追記
  ```js
      //= require bootstrap
    ```
  
  - 取得したAPI keyをconfig/credentials.yml.encに追加する
  ```bash
  # 既存のファイルを一度削除する
  rm config/credentials.yml.enc
  # 新規に作成してvimで編集する
  EDITOR="vim" bin/rails credentials:edit
  ```

  - config/credentials.yml.enc に追記
  ```yml
  hotpepper:
      key: xxxx
  ```
  xxxxの部分は取得したAPI keyをsetしてください。