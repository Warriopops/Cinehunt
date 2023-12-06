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
    @scene = Scene.new(scene_params.except(:address, :city, :country))
    @place = Place.find_or_create_by!(address: scene_params[:address], city: scene_params[:city], country: scene_params[:country])
    @scene.place = @place
    @scene.user_id = current_user.id

    if @scene.save!
      redirect_to user_path(current_user), notice: "Good job !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
    @scene.destroy
    redirect_to root_path, notice: 'scene was successfully destroyed.'
  end

  private

  def set_scene
    @scene = Scene.find(params[:id])
  end

  def scene_params
    params.require(:scene).permit(:rating, :content, :price, :payant, :time, :link, :movie_id, :address, :photo, :city, :country)
    # params.require(:scene).permit(:place_attributes => [:address, :longitude, :latitude])
  end
end
