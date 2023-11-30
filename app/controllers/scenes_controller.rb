class ScenesController < ApplicationController
  before_action :set_scene, only: [:show]
  def index
    @scenes = Scene.all
    if params[:query].present?
    @movies = Movie.where("title ILIKE :query OR category ILIKE :query", query: "%#{params[:query]}%")
    @places = Place.where("city ILIKE :query OR country ILIKE :query", query: "%#{params[:query]}%")
    end
    # The `geocoded` scope filters only scenes with coordinates
    @markers = @scenes.geocoded.map do |scene|
      {
        lat: scene.latitude,
        lng: scene.longitude
      }
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
