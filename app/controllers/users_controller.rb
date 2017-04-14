class UsersController < ApplicationController
  def index
    @users = User.all
  end

def show
  @user = User.find(params[:id])
end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to @user
    else
      render 'new'
  end


private
def user_params
  params.require(:user).permit(:name, :address, :phone, :gender)
end



end
