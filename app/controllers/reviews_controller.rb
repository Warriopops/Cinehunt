class ReviewsController < ApplicationController

  def create
    @scene = Scene.find(params[:scene_id])
    @review = Review.new(review_params)
    @review.scene = @scene
    @review.save
    # raise
    if @review.save
      redirect_to root_path(@scene)
    else
      render "scenes/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review.scene.destroy
    redirect_to scene_path(@scene), notice: 'Review was successfully destroyed.'
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end



end
