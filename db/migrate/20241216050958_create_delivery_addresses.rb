class CreateDeliveryAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_addresses do |t|
      t.string      :postal_code,                   null:false
      t.integer     :shipping_origin_region_id,     null:false 
      t.string      :city,                          null:false 
      t.string      :street_address,                null:false 
      t.string      :building_name
      t.string      :phone_number,                  null:false 
      t.references  :order, null: false,           foreign_key: true

      t.timestamps
    end
  end
end
