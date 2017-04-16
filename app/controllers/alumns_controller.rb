# File name: alumns_controller.rb
# Class name: AlumnsController
# Description: Controller used to communicate with the proprietary view of alumns
 class AlumnsController < UsersController
  def index
    @users = User.all
  end

  def show
    @alumn = Alumn.find(params[:id])
  end

   def new
     @user = User.new
     @alumn = Alumn.new
   end

   def edit
     @user = User.find(params[:id])
     @alumn = @user.alumns.find(alumn_params)
   end

   def create
     user = User.find(params[:id])
     @alumn = user.alumns.find(alumn_params)
     if @alumn.save
        redirect_to @alumn
     else
        render 'new'
     end
   end

   def update
     @user = set_user
     @alumn = @user.alumns.find(params[:id])
     if @user.update
       redirect_to @user
     else
       render 'edit'
     end
   end

   def destroy
     @user = User.find (params[:id])
     @alumn = @user.alumns.find(params[:id])
     @alumn.destroy
     redirect_to user_path(@user)
   end

 private
   # Strong params to be passed to a alumn
   def alumn_params
     params.require(:alumn).permit(:registry,
                                   :shift)
   end

   def set_user
     @user = User.find(params[:id])
   end
  end
