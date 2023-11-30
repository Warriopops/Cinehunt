class FavoriteListsController < ApplicationController
  def create
    @favorite_list = FavoriteList.new(favorite_list_params)
    @favorite_list.favorite = @favorite
    @favorite_list.scene = @scene
    @favorite_list.user = current_user
    if @favorite_list.save
      redirect_to @favorite_list
    else
      render :new
    end
  end

  private

  def favorite_list_params
    params.require(:favorite_list).permit(:name)
  end
end
