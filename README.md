# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version _7.0.0_

* System dependencies devise

* Configuration rails７

* Database creation PostgreSQL

* Database initialization usersテーブル products（商品投稿）テーブル selling_prices（販売価格）テーブル Shipping_fees(配送料)テーブル deliveryテーブル

* How to run the test suite binding.pry

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions render

* ...
# テーブル設計
# usersテーブル
| Column            | Type   | Options    |
|------------------ |--------|------------|
| encrypted_password| string | null:false |
| last_name         | string | null:false |
| first_name        | string | null:false |
| last_name_kana    | string | null:false |
| first_name_kana   | string | null:false |
| birthdate         | date   | null:false |

# Association
- has_many :products
- has_many :selling-price


# productsテーブル
| Column                  | Type       | Options    | 
|-------------------------|------------|----------- |
| product_name            | string     | null:false | 
| description             | text       | null:false |
| product_details         | string     | null:false |
| product_condition_id    | string     | null:false |
| price                   | integer    | null:false |
| user_id                 | references | null:false |
| category_id             | integer    | null:false |

# Association
- belongs_to :user
- has_one    :delivery_address
<!-- - has_one    :selling_price -->


<!-- # selling_priceテーブル -->
<!-- | Column        | Type       | Options                         | -->
<!-- |---------------|------------|---------------------------------| -->
<!-- | products_id   | references | null: false, foreign_key: true  | -->

<!-- # Association -->
<!-- - has_one :products -->

# delivery_addressテーブル
| Column              | Type       | Options    |
|-------------------- |------------|------------|
| deliver_address_id  | integer    | null:false |
| product_id          | references | null:false |
| delivery_days_id    | integer    | null:false |

# Association
- has_one :products
