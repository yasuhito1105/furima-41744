class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer      :price,                     null:false
      t.string       :product_name,              null:false
      t.references   :user,                      null:false, foreign_key: true
      t.text         :product_description,       null:false
      t.integer      :category_id,               null:false
      t.integer      :product_condition_id,      null:false
      t.integer      :shipping_fee_id,           null:false
      t.integer      :shipping_origin_region_id, null:false
      t.integer      :delivery_day_id,           null:false
      t.timestamps
    end
  end
end
