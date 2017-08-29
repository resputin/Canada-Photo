class Image < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :imager, presence: true
  mount_uploader :imager, ImagerUploader
  after_create :send_email

  def self.add_view(image)
    image.update_attributes(:views => image.views + 1)
  end

  def available?(u)
    return true if !private?
    self.user == u
  end

  def send_email
    PhotoMailer.photo_email(self.user).deliver
  end
end
