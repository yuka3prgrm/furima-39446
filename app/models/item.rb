class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price
    validates :image
  end
  with_options numericality: { other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :situation_id
    validates :postage_id
    validates :prefecture_id
    validates :shipment_id
  end

end
