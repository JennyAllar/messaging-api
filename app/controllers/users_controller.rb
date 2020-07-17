class UsersController < ApplicationController
    def index
        @users = User.all
        render json: { body: @users }, status: 200
    end
end