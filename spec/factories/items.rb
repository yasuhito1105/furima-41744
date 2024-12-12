FactoryBot.define do
  factory :item do
    product_name { Faker::Name.initials(number: 2) }
    product_description { Faker::Lorem.sentence }
    category_id { 2 }
    product_condition_id { 2 }
    shipping_fee_id { 2 }
    shipping_origin_region_id { 2 }
    delivery_day_id { 2 }
    price { 800 }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
