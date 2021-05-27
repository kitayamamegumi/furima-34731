# README
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ------------|
| email              | string | unique: true|
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル(商品情報)

| Column            | Type         | Options                         |
| ----------------- | ------------ | --------------------------------|
| item_name         | string       | null: false                     |
| describe          | text         | null: false                     |
| category_id       | integer      | null: false                     |
| condition_id      | integer      | null: false                     |
| delivery_pay_id   | integer      | null: false                     |
| delivery_from_id  | integer      | null: false                     |
| delivery_day_id   | integer      | null: false                     |
| selling_price     | integer      | null: false                     |
| user              | reference    | null: false, foreign_kye : true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| user           | references | null: false, foreign_kye : true |
| item           | references | null: false, foreign_kye : true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| card_number      | string     | null: false                     |
| expiration_date  | string     | null: false                     |
| security_code    | string     | null: false                     |
| zip_code         | string     | null: false                     |
| prefecture       | string     | null: false                     |
| city_town_id     | string     | null: false                     |
| area_number      | string     | null: false                     |
| building         | string     | null: false                     |
| phone_number     | string     | null: false                     |
| user             | references | null: false, foreign_kye : true |
| item             | references | null: false, foreign_kye : true |

### Association

- belongs_to :order

