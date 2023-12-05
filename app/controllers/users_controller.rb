class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_favorite_lists = current_user.favorite_lists
    @last_favorite_lists = FavoriteList.last(3)
  end
end
