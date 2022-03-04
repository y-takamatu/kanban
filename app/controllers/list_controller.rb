class ListController < ApplicationController
  
  
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def edit
    @list = List.find(id:params[:id])
  end

  def update
    @list = List.find_by(id:params[:id])
    if @list.update_attributes(list_params)
      redilect_to :root
    else
      render acrion: :edit
    end
  end
  private
  def list_params
    params.require(:list).permit(:title).merge(user: current_user)
  end
end
