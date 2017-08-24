class Image < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  mount_uploader :imager, ImagerUploader

  def self.add_view(image)
    views = image.views
    image.update_attributes(:views => views + 1)
  end

end
