class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :house_number
    validates :building_name
    validates :telephone_number
  end
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

end
