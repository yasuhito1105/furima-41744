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
- has_many :delivery_address



# productsテーブル                     商品情報
| Column                    | Type       | Options    | 
|-------------------------  |------------|----------- |
| price                     | integer    | null:false |
| product_name              | string     | null:false | 
| user                      | references | null:false, foreign_key: true |
| product_description       | text       | null:false |
| category_id               | integer    | null:false |
| product_condition_id      | integer    | null:false |
| Shipping fee_id           | integer    | null:false |
| shipping_origin_region_id | integer    | null:false |
| delivery_days_id          | integer    | null:false |

# Association
- belongs_to :user
- has_one :product_purchase_history

# delivery_addressesテーブル             配送先住所
| Column                      | Type       | Options    |
|-----------------------------|------------|------------|
| postal_code                 | string     | null:false |
| shipping_origin_region_id   | integer    | null:false |
| city                        | string     | null:false |
| street_address              | string     | null:false |
| building_name               | string     |            |
| phone_number                | string     | null:false |
| product_purchase_history    | references | null:false, foreign_key: true |

# Association
- belongs_to :product_purchase_history


# Product_purchase_historyテーブル     商品購入履歴
| Column                 | Type       | Options   |
|------------------------|------------|-----------|
| user                | references | null:false, foreign_key: true |
| product             | references | null:false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :product
- has_one :delivery_address
