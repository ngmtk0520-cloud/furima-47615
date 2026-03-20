class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status
  has_one_attached :image
  validates :name, :info, :price, :image, presence: true
  validates :category_id, :prefecture_id, :sales_status_id, :scheduled_delivery_id, :shipping_fee_status_id,
            numericality: { other_than: 1 }
  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }
end
