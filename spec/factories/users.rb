FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    kanji_characters = %W[\u5C71\u7530 \u9234\u6728 \u7530\u4E2D \u4F50\u85E4 \u4F0A\u85E4]
    hiragana_characters = %W[\u306F\u306A\u3053 \u3042\u3044 \u3048\u307F]
    familyname            { kanji_characters.sample }
    name                  { hiragana_characters.sample }
    familyname_kana       { Faker::Name.last_name.upcase.tr('A-Z', 'ア-ン') }
    name_kana             { Faker::Name.first_name.upcase.tr('A-Z', 'ア-ン') }
    birthday              { Faker::Date.birthday }
  end
end
