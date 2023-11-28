class FavoriteListsController < ApplicationController
  def create
    @favorite_list = FavoriteList.new(favorite_list_params)
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
