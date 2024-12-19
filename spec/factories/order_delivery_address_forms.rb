FactoryBot.define do
  factory :order_delivery_address_form do
    token                     { 'tok_abcdefghijk00000000000000000' }
    postal_code               { '123-4567' }
    shipping_origin_region_id { 2 }
    city                      { '横浜市' }
    street_address            { '1-1' }
    building_name             { 'アジアビル' }
    phone_number              { '09012345678' }
  end
end
