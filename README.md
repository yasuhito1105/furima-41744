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
| nickname          | string | null:false |
| email             | string | null:false unique:true |
| encrypted_password| string | null:false |
| last_name         | string | null:false |
| first_name        | string | null:false |
| last_name_kana    | string | null:false |
| first_name_kana   | string | null:false |
| birthdate         | date   | null:false |

# Association
- has_many :products
- has_many :selling_price


# productsテーブル
| Column                  | Type       | Options    | 
|-------------------------|------------|----------- |
| price                   | integer    | null:false |
| product_name            | string     | null:false | 
| user                    | references | null:false, foreign_key: true |
| category_id             | integer    | null:false |
| product_condition_id    | integer    | null:false |
| product_description     | text       | null:false |
| product_details         | string     | null:false |
| delivery_days_id        | integer    | null:false |

# Association
- belongs_to :user
- has_one    :delivery_address


# delivery_addressテーブル
| Column                 | Type       | Options    |
|------------------------|------------|------------|
| product_id             | references | null:false,foreign_key: true |
| postal_code            | string     | null:false |
| prefecture             | string     | null:false |
| city                   | string     | null:false |
| street_address         | string     | null:false |
| building_name          | string     |            |
| phone_number           | string     | null:false |


# Association
- has_one :products
