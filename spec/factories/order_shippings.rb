FactoryBot.define do
  factory :order_shipping do
    token { 'tok_abcdefghijk00000000000000000' }
    item_id       { '1' }
    zip_code      { '123-4567' }
    prefecture_id { 2 }
    city_town     { '横浜市緑区' }
    area_number   { '青山1-1-1' }
    building      { '柳ビル103' }
    phone_number  { '09012345678' }
  end
end
