# Preview all emails at http://localhost:3000/rails/mailers/photo_mailer
class PhotoMailerPreview < ActionMailer::Preview
  def photo_mail_preview
    PhotoMailer.photo_email(User.first)
  end
end
