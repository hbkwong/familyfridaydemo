class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)

    unless @review.save
      render json: {errors: @review.errors.full_messages}, status: 422
    end
  end

  def new
    @review = Review.new
    render :new
  end

  def review_params
    params.require(:review).permit([:user_id, :lunch_id, :rating])
  end
end
