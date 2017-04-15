# File name: parents_controller.rb
# Class name: ParentsController
# Description: Controller used to communicate with the view highways/show
class ParentsController < ApplicationController

  def new
    @parent = Parent.new
  end

  def edit
    @user = set_user
    @parent = @user.parents.find(parent_params)
  end

  def create
    @user = set_user
    @parent = @user.parents.create(parent_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    @user = set_user
    @parent = @user.parents.find(params[:id])
    @parent.destroy
    redirect_to user_path(@user)
  end

  def update
    @user = set_user
    @parent = @user.parents.find(params[:id])
    if @user.update
      redirect_to @user
    else
      render 'edit'
    end
  end

  def set_user
    @user = User.find(params(:id))
  end

private

  def parent_params
    params.require(:parent).permit(:parent_cpf)
  end
end
