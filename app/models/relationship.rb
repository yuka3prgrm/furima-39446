class Relationship < ApplicationRecord
  belongs_to :following, class_name: "User"
  belongs_to :follower, class_name: "User"

  has_many :followings, through: :active_relationships, source: :follower

  has_many :followers, through: :passive_relationships, source: :following
end
