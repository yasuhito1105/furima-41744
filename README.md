# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version _7.0.0_

* System dependencies devise

* Configuration rails７

* Database creation PostgreSQL

* Database initialization usersテーブル products（商品投稿）テーブル selling_prices（販売価格）テーブル Shipping_fees(配送料)テーブル

* How to run the test suite binding.pry

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions render

* ...
#テーブル設計
# usersテーブル
｜column            ｜Type   | options  |
|------------------|--------|--------- |
|nickname        | string | null:false| 
|email           | string | null:false,unique:true |
|password          |string | null:false|
|encrypted_password| string | null:false|
｜full_name              | string | null:false|
｜name_kana              | string | null:false|
| birthdate          | string |null:false|
# Association
- has_many :products
- has_many :selling-price


# productsテーブル
|column           | Type | options | 
|-----------------|------|---------|
|image          | text ｜ null: false|
|product_name            |string| null:false | 
|description        |string| null:false |
|product_details        |string| null:false |
|category        | sting| null:false |
|condition        | string| null:false |
# Association
- has_many :user
- has_many :selling_price

# selling_priceテーブル
|column         | Type     | options|
|---------------|--------- |--------|
|price           | string    |null:false|
|user          | references |null:false,foreign_key: true|
|product|       | references | null:false,foreign_key: true|
# Association
- belongs_to :user
- belongs_to :product

# 配送についてテーブル
| column            |Type | options |
|-------------------|------|--------|
|shipping_cost         | string |null:false |
|shipping_origin         | string| null:false |
|shipping_days        |string | null: false|
# Association
- has_many :product