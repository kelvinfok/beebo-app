class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @houses = current_user.houses
  end

  def show
    @photos = @house.photos
  end

  def new
    @house = current_user.houses.build
  end

  def create
    @house = current_user.houses.build(house_params)

    if @house.save

      if params[:images]
        params[:images].each do |image|
          @house.photos.create(image: image)
        end
      end

      @photos = @house.photos
      redirect_to edit_house_path(@house), notice: "Listing Saved!"
    else
      flash[:alert] = "Please provide all information for this house."
      render :new
    end
  end

  def edit
    if current_user.id == @house.user.id
      @photos = @house.photos
    else
      redirect_to root_path, notice: "You don't have permission."
    end
end

  def update
    if @house.update(house_params)

      if params[:images]
        params[:images].each do |image|
          @house.photos.create(image: image)
        end
      end

      redirect_to edit_house_path(@house), notice: "Updated Successfully!"
    else
      flash[:alert] = "Please provide all information for this house."
      render :edit
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:home_type, :size, :summary, :fee_simple, :room_type, :bed_room, :isActive, :bath_room, :listing_name, :address, :region, :price)
    end

end
