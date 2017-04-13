class ParentsController < ApplicationController

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
