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

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.parent.build
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
      @parent= Parent.find(params[:id])
      @parent.destroy

      redirect_to parents_path
  end


def update

  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to @users
  else
    render 'edit'
  end
end

def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to users_path
end



private
  def user_params
    params.require(:user).permit(:name, :address, :phone, :gender)
  end

end
