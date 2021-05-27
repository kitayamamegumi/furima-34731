# README
# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| email        | string | null: false |
| password     | string | null: false |
| nickname     | string | null: false |
| name_full    | string | null: false |
| name_kana    | string | null: false |
| birthday     | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル(商品情報)

| Column         | Type         | Options                         |
| -------------- | ------------- | -------------------------------|
| image          |              | null: false                     |
| item_name      | string       | null: false                     |
| describe       | text         | null: false                     |
| category       | integer      | null: false                     |
| condition      | integer      | null: false                     |
| about_delivery | integer      | null: false                     |
| delivery_from  | integer      | null: false                     |
| selling_price  | string       | null: false                     |
| user           | reference    | null: false, foreign_kye : true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| card_number    | string     | null: false                     |
| expiration_date| string     | null: false                     |
| security_code  | string     | null: false                     |
| zip_code       | string     | null: false                     |
| prefecture     | string     | null: false                     |
| city_town      | string     | null: false                     |
| area_number    | string     | null: false                     |
| building       | string     | null: false                     |
| phone_number   | string     | null: false                     |
| user           | references | null: false, foreign_kye : true |
| item           | references | null: false, foreign_kye : true |

### Association

- belongs_to :user
- belongs_to :item
