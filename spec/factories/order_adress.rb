FactoryBot.define do
  factory :order_address do
    
    postal_code      {Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s}
    prefecture_id    { Faker::Number.between(from: 2, to: 48) }
    city             {Faker::Lorem.sentence}
    house_number     {Faker::Lorem.sentence}
    building_name    {Faker::Lorem.sentence}
    telephone_number {Faker::Number.number(digits: 10)}
    token            {"tok_abcdefghijk00000000000000000"}

    association :item_id
    association :user
  end
end