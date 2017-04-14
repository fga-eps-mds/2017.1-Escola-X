# File name: parents_controller.rb
# Class name: ParentsController
# Description: Controller used to communicate with the view highways/show
class ParentsController < ApplicationController


  def new
    @parent = Parent.new
  end

  def create
    @user = User.find(params[id])
    @parent = @user.parents.create(parent_params)
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

##  def update

##  end

private
  def parent_params
    params.require(:parent).permit(:parent_cpf)
  end

end
