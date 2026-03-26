class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :city, :prefecture_id, :addresses, :building, :phone_number, :token

  validates :user_id, :item_id, :token, presence: true
  validates :postal_code, :prefecture_id, :city, :addresses, :phone_number, presence: true
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }

  def save
    return false if invalid?

    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city: city,
                   prefecture_id: prefecture_id, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end
