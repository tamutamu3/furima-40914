## usersテーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------  |
| name                | string | null: false |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false |
| nickname            | string | null: false |
| birthday            | string | null: false |

### Association
- has_many :items
- has_many :purchase
- has_many :comments



## itemsテーブル

| Column              | Type        | Options     |
| ------------------- | ----------- | ----------  |
| items_nam           | string      | null: false |
| explain             | string      | null: false |
| category            | string      | null: false |
| condition           | string      | null: false |
| fee                 | string      | null: false |
| ship_from           | string      | null: false |
| ship_date           | string      | null: false |
| price               | string      | null: false |
| user                | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase
- has_many :comments



## purchaseテーブル

| Column              | Type        | Options     |
| ------------------- | ----------- | ----------  |
| history             | string      | null: false |
| user                | references  | null: false, foreign_key: true |
| items               | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :items
- has_one :address



## purchaseテーブル

| Column              | Type        | Options     |
| ------------------- | ----------- | ----------  |
| postcord            | string      | null: false |
| prefecture          | string      | null: false |
| city                | string      | null: false |
| adressline1         | text        | null: false |
| adressline2         | text        | null: false |
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