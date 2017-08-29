class Image < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :imager, presence: true
  mount_uploader :imager, ImagerUploader
  after_create :send_email
  after_create :send_text_message

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

  def send_text_message
    @twilio_client = Twilio::REST::Client.new ENV['twilio_sid'], ENV['twilio_token']

    @twilio_client.messages.create(
      :from => "+1#{ENV['twilio_phone_number']}",
      :to => 6197278112,
      :body => "This is an message. It gets sent to Dylan"
    )
  end
end
