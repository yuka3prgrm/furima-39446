class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :order_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "が無効です ハイフン(-)を含めて入力してください"}
    validates :city
    validates :house_number
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "が無効です 半角数字のみ入力してください"}
    validates :item_id
    validates :user_id
    validates :token
  end
    validates :prefecture_id, numericality: { other_than: 1, message: "を入力してください" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end