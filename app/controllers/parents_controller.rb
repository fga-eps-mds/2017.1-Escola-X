class ParentsController < ApplicationController
# File name: parents_controller.rb
# Description: Controller used to communicate with the view highways/show
  def new

  end

  def destroy
      @parent= Parent.find(params[:id])
      @parent.destroy

      redirect_to parents_path
  end

  def update

  end
end
