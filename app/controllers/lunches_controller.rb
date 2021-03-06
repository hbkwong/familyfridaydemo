class LunchesController < ApplicationController
  def create
    @lunch = Lunch.new(lunch_params)

    unless @lunch.save
      render json: {errors: @lunch.errors.full_messages}, status: 422
    end
  end

  def show
    @lunch = Lunch.find_by(id: params[:id])
  end

  private

  def lunch_params
    params.require(:lunch).permit([:name, :restaurant_id])
  end
end
