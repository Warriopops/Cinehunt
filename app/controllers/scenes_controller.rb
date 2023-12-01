class ScenesController < ApplicationController
  before_action :set_scene, only: [:show]
  def index
    @scenes = Scene.all
    @favorite = Favorite.new
    @scene = Scene.new
    #if params[:query].present?
    #@movies = Movie.where("title ILIKE :query OR category ILIKE :query", query: "%#{params[:query]}%")
    #@places = Place.where("city ILIKE :query OR country ILIKE :query", query: "%#{params[:query]}%")
    #end
    if params[:query].present?
      sql_subquery = <<~SQL
      movies.title ILIKE :query
      OR movies.category ILIKE :query
      OR places.country ILIKE :query
      OR places.city ILIKE :query
      SQL
    @scenes = @scenes.joins(:movie, :place).where(sql_subquery, query: "%#{params[:query]}%")
  end
  end

  def show
    @review = Review.new
    @favorite = Favorite.new
  end

  def new
    @scene = Scene.new
  end

  def create
    @scene = Scene.new(scene_params)
    @scene.movie = Movie.find(params[:movie_id])
    if @scene.save
      redirect_to @scene
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_scene
    @scene = Scene.find(params[:id])
  end

  def scene_params
    params.require(:scene).permit(:rating, :content, :price, :payant, :time, :link, :movie_id)
  end
end
