# File name: alumns_controller.rb
# Class name: AlumnsController
# Description: Controller used to communicate with the proprietary view of alumns
 class AlumnsController < UsersController

  def index
    if ( logged_in? )
      @alumns = Alumn.all
    end
  end

  def show
    if ( logged_in? )
      @alumn = Alumn.find(params[:id])
      @user = User.find_by_id(@alumn.user_id)
    end
  end

  def new
    if ( is_principal? )
      @user = User.new
    end
  end

  def edit
    if ( is_principal? )
      @alumn = Alumn.find(params[:id])
      @user = User.find_by_id(@alumn.user_id)
    end
  end

  def destroy
    if ( is_principal? )
      @alumn = Alumn.find(params[:id])
      @user = User.find (@alumn.user_id)
      @user.destroy

      redirect_to users_path
    end
  end

 private
   # Strong params to be passed to a alumn
   def alumn_params
     params.require(:alumn).permit(:registry,
                                   :shift,
                                   :image,
                                   user_attributes:[:name,
                                                    :address,
                                                    :phone,
                                                    :gender,
                                                    :birth_date,
                                                    :permission])
   end
  end
