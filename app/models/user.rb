class User < ApplicationRecord
  has_many :images
  validates :name, presence: true
  validates :email, presence: true 
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  def feed
    Image.where('user_id = ?', id)
  end
end
