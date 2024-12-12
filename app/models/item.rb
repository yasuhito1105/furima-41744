class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_fee
  belongs_to :shipping_origin_region
  belongs_to :delivery_day

  validates :image,               presence: true
  validates :product_name,        presence: true
  validates :product_description, presence: true

  validates :price, presence: true, numericality:     { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :product_condition_id, numericality:      { other_than: 1, only_integer: true, message: "can't be blank" }
  validates :category_id, numericality:               { other_than: 1, only_integer: true, message: "can't be blank" }
  validates :shipping_fee_id, numericality:           { other_than: 1, only_integer: true, message: "can't be blank" }
  validates :shipping_origin_region_id, numericality: { other_than: 1, only_integer: true, message: "can't be blank" }
  validates :delivery_day_id, numericality:           { other_than: 1, only_integer: true, message: "can't be blank" }
end
