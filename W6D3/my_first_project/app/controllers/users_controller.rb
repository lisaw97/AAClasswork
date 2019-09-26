class UsersController < ApplicationController
  def index
    user = User.all
    render json: user
  end

  def create
    render json: params
  end

  def show
    render json: params
  end
end