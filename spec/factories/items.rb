FactoryBot.define do
  factory :item do
    image                 { Faker::Lorem.sentence }
    name                  { '写真' }
    discribe              { '夏' }
    category_id           { 2 }
    condition_id          { 2 }
    delivery_pay_id       { 2 }
    prefecture_id         { 2 }
    delivery_day_id       { 2 }
    selling_price         { 1_000_000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
