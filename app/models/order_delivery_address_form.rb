class OrderDeliveryAddressForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_origin_region_id, :city, :street_address, :building_name,
                :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code,format:     { with: /\A[0-9]{3}-[0-9]{4}\z/,message: 'Postal code is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :city, format:           { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
    validates :street_address
    validates :phone_number,   length: { minimum: 10, message: 'is too short' },
                               format: { with: /\A\d+\z/, message: 'is invalid. Input only number'}
  end

  validates :shipping_origin_region_id, numericality: { other_than: 1 , only_integer: true, message: "can't be blank" }

  def save
    order = Order.create(user_id:, item_id:)
    
    DeliveryAddress.create(
      postal_code: postal_code,
      shipping_origin_region_id: shipping_origin_region_id,
      city: city,
      street_address: street_address,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
