class Image < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  mount_uploader :imager, ImagerUploader
end
