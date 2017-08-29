class PhotoMailer < ApplicationMailer
  default from: "notification@canadaphoto.com"

  def photo_email(user)
    @user = user
    if @user.followers.any?
      @user.followers.each do |follower|
        @follower = follower
        mail(to: follower.email, subject: "#{@user.name} posted a new photo!")
      end
    end
  end
end
