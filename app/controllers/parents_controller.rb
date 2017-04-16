# File name: parents_controller.rb
# Class name: ParentsController
# Description: Controller used to communicate with the view highways/show
class ParentsController < UsersController

  def index
    @parents = Parent.all
  end

  def show
    @parent = Parent.find(params[:id])
    @user = User.find_by_id(@parent.user_id)
  end

   def new
     @user = User.new
   end

   def edit
     @parent = Parent.find(params[:id])
     @user = User.find_by_id(@parent.user_id)
   end

   def destroy
     @parent = Parent.find(params[:id])
     @user = User.find (@parent.user_id)
     @user.destroy
     redirect_to users_path
   end

private
  def parent_params
    params.require(:parent).permit(:parent_cpf)
  end
end
