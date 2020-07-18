class UsersController < ApplicationController
  def index
    @users = User.all.pluck(:name, :email)
    count = User.count
    render json: { total: count, users: @users }, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      render json: { user: @user }, status: 201
    else
      render json: { error: @user.errors.full_messages}, status: 400
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
