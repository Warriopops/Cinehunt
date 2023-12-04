class ScenesController < ApplicationController
  before_action :set_scene, only: [:show]
  def index
    @scenes = Scene.all
    @favorite = Favorite.new
    if params[:query].present?
      sql_subquery = <<~SQL
      movies.title ILIKE :query
      OR movies.category ILIKE :query
      OR places.country ILIKE :query
      OR places.city ILIKE :query
      SQL
    @scenes = @scenes.joins(:movie, :place).where(sql_subquery, query: "%#{params[:query]}%")
    end
    # The `geocoded` scope filters only scenes with coordinates
    @places = Place.all
    @markers = @places.geocoded.map do |place|
      {
        latitude: place.latitude,
        longitude: place.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {place: place})
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
    @scene.user_id = current_user.id
    raise
    @scene.movie = Movie.find(params[:movie_id])
    if @scene.save
      redirect_to root_path, notice: "Good job !"
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
