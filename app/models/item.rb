class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipment

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price, format: { with: /\A[3-9]\d{2}|[1-9]\d{3,6}|9999999\z/ }
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
