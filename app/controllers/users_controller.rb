class UsersController < ApplicationController
  def created_at
    @user = User.new(user_params)

    unless @user.save
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit([:email, :name, :team])
  end
end
