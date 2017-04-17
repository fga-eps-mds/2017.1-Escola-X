# File name: alumns_controller.rb
# Class name: AlumnsController
# Description: Controller used to communicate with the proprietary view of alumns
 class AlumnsController < UsersController
  def index
    @alumns = Alumn.all
  end

  def show
    @alumn = Alumn.find(params[:id])
    @user = User.find_by_id(@alumn.user_id)
  end

  def new
    @user = User.new
  end

   def edit
     @alumn = Alumn.find(params[:id])
     @user = User.find_by_id(@alumn.user_id)
   end

   def destroy
     @alumn = Alumn.find(params[:id])
     @user = User.find (@alumn.user_id)
     @user.destroy
     redirect_to users_path
   end

 private
   # Strong params to be passed to a alumn
   def alumn_params
     params.require(:alumn).permit(:registry,
                                   :shift,
                                   user_attributes:[:name, :address, :phone, :gender, :birth_date, :permission])
   end
  end
