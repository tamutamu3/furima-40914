## usersテーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------  |
| familyname          | string | null: false |
| name                | string | null: false |
| familyname_kana     | string | null: false |
| name_kana           | string | null: false |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false |
| nickname            | string | null: false |
| birthday            | date   | null: false |

### Association
- has_many :items
- has_many :purchases
- has_many :comments



## itemsテーブル

| Column              | Type        | Options     |
| ------------------- | ----------- | ----------  |
| item_name           | string      | null: false |
| explain             | text        | null: false |
| category_id         | integer     | null: false |
| condition_id        | integer     | null: false |
| fee_id              | integer     | null: false |
| from_id             | integer     | null: false |
| date_id             | integer     | null: false |
| price               | integer     | null: false |
| user                | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase
- has_many :comments



## purchasesテーブル

| Column              | Type        | Options     |
| ------------------- | ----------- | ----------  |
| user                | references  | null: false, foreign_key: true |
| item                | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address



## addressesテーブル

| Column              | Type        | Options     |
| ------------------- | ----------- | ----------  |
| postcord            | string      | null: false |
| prefecture_id       | integer     | null: false |
| city                | string      | null: false |
| block               | text        | null: false |
| building            | text        |             |
| phone_number        | string      | null: false |
| purchase            | references  | null: false, foreign_key: true |

### Association
- belongs_to :purchase



## commentsテーブル

|Column   |Type        | Options     |
| ------- | ---------- | ----------- |
| content | text       | null: false |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item