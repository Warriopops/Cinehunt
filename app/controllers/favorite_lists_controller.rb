class FavoriteListsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @favorite_lists = current_user.favorite_lists
  end

  def show
    @favorite_list = current_user.favorite_lists.find(params[:id])
  end

  def create
    @favorite_list = FavoriteList.new(favorite_list_params)
    @favorite_list.favorite = @favorite
    @favorite_list.scene = @scene
    @favorite_list.user = current_user
    if @favorite_list.save
      redirect_to @favorite_list
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @favorite_list = FavoriteList.new
  end

  def destroy
    @favorite_list = current_user.favorite_lists.find(params[:id])
    @favorite_list.destroy
    redirect_to favorite_lists_path
  end

  private

  def favorite_list_params
    params.require(:favorite_list).permit(:name)
  end
end
