class UsersController < ApplicationController
    def index
        @users = User.all.pluck(:name, :email)
        count = User.count
        render json: { total: count, users: @users }, status: 200
    end
end