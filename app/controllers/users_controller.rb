# File name: users_controller.rb
# Class name: UsersController
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_permission

  def index
    @users = permission_class.all
  end

  def show
  end

  def new
    @user = permission_class.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "#{permission} criado com sucesso!"
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "#{permission} criado com sucesso!"
    else
      render action: 'edit'
    end
  end

  def destroy
  end

  private

  def set_permission
    @permission = permission
  end

  def permission
    User.permissions.include?(params[:type]) ? params[:type] : "Alumn"
  end

  def permission_class
    permission.constantize
  end

  def set_user
    @user = permission_class.find(params[:id])
  end

  # Strong params to be passed to users
  def user_params
    params.require(permission.underscore.to_sym).permit(:registry,
                                                        :cpf,
                                                        :name,
                                                        :address,
                                                        :phone,
                                                        :gender,
                                                        :birth_date,
                                                        :classroom,
                                                        :shift,
                                                        :permission,
                                                        :admission_date)
  end
end
