class ScenesController < ApplicationController
  # before_action :set_scene, only: [:show]
  def index
    @scenes = Scene.all
  end

  def show
  end

  def new
    @scene = Scene.new
  end

  def create
    @scene = Scene.new(scene_params)
    if @scene.save
      redirect_to @scene
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_scene
    # @scene = Scene.find(params[:id])
  end

  def scene_params
    params.require(:scene).permit(:rating, :content, :price, :payant, :time, :link)
  end
end
