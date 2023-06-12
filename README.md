# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# README

# テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false, unique: true |
| encrypted_password     | string | null: false |
| first_name             | string | null: false |
| last_name              | string | null: false |
| first_name_kana        | string | null: false |
| last_name_kana         | string | null: false |
| birthday               | date   | null: false |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column         | Type        | Options                        |
| -------------- | ----------- | -------------------------------|
| name           | string      | null: false                    |
| explanation    | text        | null: false                    |
| category_id    | integer     | null: false                    |
| situation_id   | integer     | null: false                    |
| postage_id     | integer     | null: false                    |
| region_id      | integer     | null: false                    |
| shipment_id    | integer     | null: false                    |
| price          | integer     | null: false                    |
| user           | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_one_attached :image

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | integer    | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association
- belongs_to :order

