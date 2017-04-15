# File name: alumns_controller.rb
# Class name: AlumnsController
# Description: Controller used to communicate with the proprietary view of alumns
 class AlumnsController < UsersController
#   def index
#     @alumns = Alumn.all
#   end

#   def show
#     @alumn = Alumn.find(params[:id])
#   end
#
   def new
     @alumn = Alumn.new
   end

   def edit
     @user = User.find(params[:id])
     @alumn = @user.alumns.find(alumn_params)
   end

   def create
     @user = User.find(params[:id])
     @alumn = @user.alumns.find(alumn_params)

     if @alumn.save
        redirect_to @alumn
     else
        render 'new'
     end
   end

   def update
     @user = User.find(params[:id])
     @parent = @user.alumns.find(params[:id])

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
     redirect_to alumns_path(@user)
   end

   private
   # Strong params to be passed to a alumn
   def alumn_params
     params.require(:alumn).permit(:registry,
                                   :shift)
   end
  end
 end
