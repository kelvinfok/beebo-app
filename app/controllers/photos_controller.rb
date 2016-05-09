class PhotosController < ApplicationController

  def destroy
    @photo = Photo.find(params[:id])
    house = @photo.house

    @photo.destroy
    @photos = Photo.where(house_id: house.id)

    respond_to :js
  end

end
