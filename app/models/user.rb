class User < ApplicationRecord
  has_many :images
  has_many :active_relationships,   class_name: "Relationship",
                                    foreign_key: "follower_id"
  has_many :passive_relationships,  class_name: "Relationship",
                                    foreign_key: "followed_id"
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  validates :name, presence: true
  validates :email, presence: true 
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_secure_password

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Image.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
