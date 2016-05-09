class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @houses = @user.houses
  end
end
