class UsersController < ApplicationController
  include SessionsHelper
  before_action :set_user, only:[:update]

  def index
    if logged_in?
      @users = permission_class.all
    end
  end

  def show
    if logged_in?
      @user = permission_class.find(params[:id])
    end
  end

  def new
    if is_principal?
      #method
    end
  end

  def edit
    if is_principal?
      #method
    end
  end

  def create
    if is_principal?
    #method
    end
  end

  def update
    if is_principal?
      @user = permission_class.find(params[:id])
      if @user.update(user_params)
        redirect_to @user, notice: "Password do usuário #{@user.name} foi atualizado!"
      else
        render 'edit_password'
      end
    end
  end

  def destroy
    if is_principal?
      #method
    end
  end

  def edit_password
    if is_principal?
      @user = permission_class.find(params[:id])
    end
  end

  def permission
    User.permissions.include?(params[:type]) ? params[:type] : "User"
  end

  def set_user
    @user = permission_class.find(params[:id])
  end

  def permission_class
     permission.constantize
  end


private
def user_params
  params.require(permission.underscore.to_sym).permit(:name,:registry,:cpf,:address,:gender,:password,:classroom,:shift,:birth_date,:admission_date)
end

end
