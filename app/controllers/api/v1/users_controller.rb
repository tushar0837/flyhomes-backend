class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    @user= current_user
    unless current_user.id.to_s == params[:id]
      render json: { error: 'Not the signed in user' }, status: 401
      return
    end
    user = @user.update_attributes(user_params)
    if user
      render json: {user: current_user}, status: 200
    else
      render json: {message: 'Data not updated, Please try again'}, status: 400
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :country, :city)
  end
end
