class User < ApplicationRecord
  has_many :items
  has_many :orders

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
