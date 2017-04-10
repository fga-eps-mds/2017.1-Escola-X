# File name: users_controller.rb
# Class name: UsersController
class UsersController < ApplicationController
  before_action :set_permission

  def index
    @users = permission_class.all
  end

  def show
    @user = permission_class.find(params[:id])
  end

  def new
    @user = permission_class.new()
  end

  def edit
    @user = permission_class.find(params[:id])
  end

  def create
      @user = permission_class.new(user_params)
    # @user.permission = @permission
    if @user.save
      # debugger
      redirect_to @user, notice: "#{permission} criado com sucesso!"
    else
      render action: 'new'
    end
  end

  def update
    @user = permission_class.find(params[:id])
    # debugger
    if @user.update(user_params)
      redirect_to @user, notice: "#{permission} criado com sucesso!"
    else
      render action: 'edit'
    end
  end

  def destroy
  end

  private

  # def get_years_old
  #   @years_old = DateTime.now.year - self.birth_date.year
  # end

  def set_permission
    @permission = permission
  end

  def permission
    User.permissions.include?(params[:type]) ? params[:type] : "User"
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
                                                        :user,
                                                        :permission,
                                                        :cpf,
                                                        :name,
                                                        :address,
                                                        :phone,
                                                        :gender,
                                                        :birth_date,
                                                        :classroom,
                                                        :shift,
                                                        :admission_date)
  end
end
