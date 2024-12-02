# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version _7.0.0_

* System dependencies devise

* Configuration rails７

* Database creation PostgreSQL

* Database initialization usersテーブル products（商品投稿）テーブル selling-prices（販売価格）テーブル Shipping-fees(配送料)テーブル

* How to run the test suite binding.pry

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions render

* ...
#テーブル設計
# usersテーブル
｜column            ｜Type   | options  |
|------------------|--------|--------- |
|ニックネーム        | string | null:false| 
|メールアドレス      | string | null:false,unique:true |
|パスワード          |string | null:false|
|encrypted_password| string | null:false|
｜お名前(全角)       | string | null:false|
｜お名前カナ(全角)    | string | null:false|
|生年月日           | string |null:false|
# Association
- has_many :products
- has_many :selling-price


# productsテーブル
|column           | Type | options | 
|-----------------|------|---------|
|商品画像          | text ｜ null: false|
|商品名            |string| null:false | 
|商品の説明        |string| null:false |
|商品の詳細        |string| null:false |
|カテゴリー        | sting| null:false |
|商品の状態        | string| null:false |
# Association
- has_many :user
- has_many :selling-price

# selling-priceテーブル
|column         | Type     | options|
|---------------|--------- |--------|
|価格           | string    |null:false|
|user          | references |null:false,foreign_key: true|
|product|       | references | null:false,foreign_key: true|
# Association
- belongs_to :user
- belongs_to :product





 

<!-- # 配送についてテーブル -->
<!-- | column            |Type | options | -->
<!-- |-------------------|------|--------| -->
<!-- |配送料の負担         | string |null:false | -->
<!-- |発送元の地域         | string| null:false | -->
<!-- |発送までの日数        |string | null: false| -->


<!-- # commntsテーブル -->
<!-- | column | Type | options | -->
<!-- |--------|------|---------| -->



