class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @image = current_user.images.build
    end
  end

end
