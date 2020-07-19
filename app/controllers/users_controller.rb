class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: 'user not found'
  end

  def index
    @users = User.all.pluck(:name, :email)
    count = User.count
    render json: { total: count, users: @users }, status: 200
  end

  def create
    user = User.new(user_params)
    if user.save!
      render json: { user: @user }, status: 201
    else
      render json: 'unable to create user', status: 400
      return
    end
  end

  def show
    @user = User.find_by(email: params[:email])
  end


  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
