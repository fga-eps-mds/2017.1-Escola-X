class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end


private
def user_params
  params.require(:user).permit(:name, :address, :phone, :gender)
end



end
