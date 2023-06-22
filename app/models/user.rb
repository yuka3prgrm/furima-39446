class User < ApplicationRecord
  has_many :items
  has_many :orders

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
    follower =  passive_relationships.find_by(following_id: user.id)
    return follower.present?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'が無効です 全角文字を入力してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'が無効です 全角文字を入力してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'が無効です 全角カタカナを入力してください' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'が無効です 全角カタカナを入力してください' }
    validates :birthday
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字の混在で入力してください' }
end
