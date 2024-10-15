FactoryBot.define do
  factory :purchase_address do
    postcode            { '123-4567' }
    prefecture_id       { 2 }
    city                { '大阪府' }
    block               { '1-1' }
    building            { '大阪ハイツ' }
    phone_number        { '0123456789' }
    token               { 'tok_abcdefghijk00000000000000000' }
  end
end
