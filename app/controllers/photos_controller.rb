class PhotosController < ApplicationController
  before_action :authenticate_user!

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to root_path
      flash[:success] = "Photo with title \"#{@photo.title}\" succesfully created! 😁"
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :image)
  end
end
