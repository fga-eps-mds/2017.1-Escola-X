class ParentsController < ApplicationController
# File name: parents_controller.rb
# Description: Controller used to communicate with the view highways/show
#


  def new

  end

  def create
    @user = User.find(params[:user_id])
    @parent = @user.parents.create(parent_params)
    redirect_to user_path(@user)

  end

  def destroy
      @parent= Parent.find(params[:id])
      @parent.destroy

      redirect_to parents_path
  end

  def update

  end

private
def parent_params
  params.require(:parent).permit(:parent_cpf)
end

end

end
