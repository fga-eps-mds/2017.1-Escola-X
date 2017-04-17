# File name: parents_controller.rb
# Class name: ParentsController
# Description: Controller used to communicate with the view highways/show
class ParentsController < UsersController

  def index
    if ( logged_in? )
      @parents = Parent.all
    end
  end

  def show
    if ( logged_in? )
      @parent = Parent.find(params[:id])
      @user = User.find_by_id(@parent.user_id)
    end
  end

  def new
    if ( is_principal? )
       @user = User.new
    end
  end

  def edit
    if ( is_principal? )
      @parent = Parent.find(params[:id])
      @user = User.find_by_id(@parent.user_id)
    end
  end

   def destroy
     if ( is_principal? )
       @parent = Parent.find(params[:id])
       @user = User.find (@parent.user_id)
       @user.destroy
       redirect_to users_path
     end
   end

private
  def parent_params
    params.require(:parent).permit(:parent_cpf)
  end
end
