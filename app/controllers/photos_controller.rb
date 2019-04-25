class PhotosController < ApplicationController
  before_action :authenticate_user!
  def new
    new_photo
  end

  def create
    new_photo
    if @photo.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def new_photo
    @photo = Photo.new(photo_params)
  end

  def photo_params
    params.require(:photo).permit(:title, :image, :description)
  end
end
