FactoryBot.define do
  factory :item do
    image                 { Faker::Lorem.sentence }
    item_name             { Faker::Commerce.product_name }
    explain               { Faker::Lorem.paragraph }
    category_id           { 2 }
    condition_id          { 2 }
    fee_id                { 2 }
    prefecture_id         { 2 }
    prepare_id            { 2 }
    price                 { Faker::Commerce.price(range: 300..9_999_999, as_string: true) }
    association :user
  end
end
