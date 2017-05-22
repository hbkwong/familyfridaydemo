class RestaurantsController < ApplicationController
  def create
    @restaurant = Restaurant.new(restaurant_params)

    unless @restaurant.save
      render json: {errors: @restaurant.errors.full_messages}, status: 422
    end
  end

  def restaurant_params
    params.require(:user).permit([:name, :logo, :yelp_link])
  end
end
