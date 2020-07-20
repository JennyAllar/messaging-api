class UsersController < ApplicationController
  def index
    @users = User.all
    count = User.count
    render json: { total: count, users: @users }, status: 200
  end

  def create
    user = User.new(user_params)
    if user.save!
      render json: { user: user }, status: 201
    end
  end

  def show
    user = User.find(params[:id])
    if user
      render json: {user: user}, status: 200
    end
  end

  def messages
    @messages = Message.where(user_id: params[:id])
    if @messages
      render json: {conversations: @messages }
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
