# README
# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -------------------------|
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル(商品情報)

| Column            | Type         | Options                         |
| ----------------- | ------------ | --------------------------------|
| name              | string       | null: false                     |
| describe          | text         | null: false                     |
| category_id       | integer      | null: false                     |
| condition_id      | integer      | null: false                     |
| delivery_pay_id   | integer      | null: false                     |
| prefecture_id     | integer      | null: false                     |
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
| zip_code         | string     | null: false                     |
| prefecture_id    | integer    | null: false                     |
| city_town        | string     | null: false                     |
| area_number      | string     | null: false                     |
| building         | string     |                                 |
| phone_number     | string     | null: false                     |
| order            | references | null: false, foreign_kye : true |

### Association

- belongs_to :order

