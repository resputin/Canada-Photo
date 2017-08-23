class ImagesController < ApplicationController

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      redirect_to users_path
    else
      render user
    end
  end

  private

  def image_params
    params.require(:image).permit(:content, :imager)
  end

end
