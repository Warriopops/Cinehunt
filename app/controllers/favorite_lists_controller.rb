class FavoriteListsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @favorite_lists = current_user.favorite_lists
  end

  def show
    @favorite_list = current_user.favorite_lists.find(params[:id])
  end

  def create
    @favorite_list = current_user.favorite_lists.build(favorite_list_params)

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
