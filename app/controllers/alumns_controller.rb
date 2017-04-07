# File name: alumns_controller.rb
# Class name: AlumnsController
# Description: Controller used to communicate with the proprietary view of alumns
 class AlumnsController < UsersController
#   def index
#     @alumns = Alumn.all
#   end
#
#   def show
#     @alumn = Alumn.find(params[:id])
#   end
#
#   def new
#     @alumn = Alumn.new
#   end
#
#   def edit
#     @alumn = User.find(params[:id])
#   end
#
#   def create
#     @alumn = Alumn.new(alumn_params)
#
#     @alumn.save
#     redirect_to @alumn
#   end
#
#   def update
#     @alumn = Alumn.find(params[:id])
#
#     if (@alumn.update(alumn_params))
#       redirect_to @alumn
#     else
#       render 'edit'
#     end
#   end
#
#   def destroy
#     @alumn = Alumn.find (params[:id])
#     @alumn.destroy
#
#     redirect_to alumns_path
#   end
#
#   private
#   # Strong params to be passed to a alumn
#   def alumn_params
#     params.require(:alumn).permit(:name_alumn,
#                                   :registry_alumn,
#                                   :class_alumn,
#                                   :shift_alumn,
#                                   :address_alumn,
#                                   :phone_alumn,
#                                   :birth_date_alumn,
#                                   :gender_alumn)
#   end
# end
 end
