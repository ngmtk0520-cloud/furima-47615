TECHCAMP 最終課題<フリマサイトの作成>
Furima

デプロイ先 (AWS)
http://13.192.199.108

Basic認証
ID: admin
Pass: 2222

ログイン用アカウント
email: test@test.com
password: 111111abc

Backend
Ruby 3.2.0
Ruby on Rails 7.1.0
認証: Devise
テスト: RSpec

インフラ構成
サーバー: AWS (EC2)
Webサーバー: Nginx
アプリサーバー: Unicorn
データベース: MariaDB
言語/フレームワーク: Ruby 3.2.0 / Ruby on Rails 7.1.0
画像ストレージ: AWS S3


markdown
## データベース設計

### users テーブル


| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date         | date   | null: false |

#### Association
- has_many :items
- has_many :orders

### items テーブル


| Column                 | Type    | Options     |
| ---------------------- | ------- | ----------- |
| name                   | string  | null: false |
| info                   | text    | null: false |
| category_id            | integer | null: false |
| sales_status_id        | integer | null: false |
| shipping_fee_status_id | integer | null: false |
| prefecture_id          | integer | null: false |
| scheduled_delivery_id  | integer | null: false |
| price                  | integer | null: false |
| user                   | references | null: false, foreign_key: true |

#### Association
- belongs_to :user
- has_one :order

### orders テーブル


| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

#### Association
- belongs_to :user
- belongs_to :item
- has_one :address

### addresses テーブル


| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

#### Association
- belongs_to :order