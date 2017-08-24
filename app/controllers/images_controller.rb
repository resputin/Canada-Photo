class ImagesController < ApplicationController

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      redirect_to root_path
    else
      render root_path
    end
  end

  def show
    @image = Image.find(params[:id])
    @views = @image.views
    Image.add_view @image
  end

  private

  def image_params
    params.require(:image).permit(:content, :imager)
  end

end
