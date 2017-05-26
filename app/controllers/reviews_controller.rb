class ReviewsController < ApplicationController
  def create
    # @review = Review.new(review_params)
    #
    # if @review.save
    #   render :show
    # else
    #   render json: {errors: @review.errors.full_messages}, status: 422
    # end
    @review = Review.create(user_id: params[:user_id], lunch_id: params[:lunch_id], rating: params[:rating])
    render :show
  end

  def show
    @review = Review.find_by(id: params[:id])
    render :show
  end

  def new
    @review = Review.new
    render :new
  end

  private

  def review_params
    params.require(:review).permit([:user_id, :lunch_id, :rating])
  end
end
