FactoryBot.define do
  factory :item do
    name        { 'test' }
    info             { 'test' }
    price            { 1000 }
    category_id      { 2 }
    prefecture_id    { 2 }
    sales_status_id  { 2 }
    scheduled_delivery_id { 2 }
    shipping_fee_status_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png', content_type: 'image/png')
    end
  end
end
