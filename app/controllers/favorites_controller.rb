class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      redirect_to scenes_path
    else
      puts @favorite.errors.full_messages
    end
  end



  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    # @favorite_list = FavoriteList.find(params[:id])

    # @favorite_list.favorites.destroy_all

    # @favorite_list.destroy

    redirect_to favorite_lists_path, notice: 'Le favori a été supprimé avec succès.'
  end

  private

  def favorite_params
    params.require(:favorite).permit(:scene_id, :favorite_list_id)
  end

end
