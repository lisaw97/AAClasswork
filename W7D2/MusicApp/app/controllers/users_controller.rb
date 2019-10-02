class UsersController < ApplicationController

  # def index
  #   @users = User.all 
  #   render :index
  # end
  
  def new
    render :new
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user.id)
    else
      render json: "unable to save user", status: 422
    end
  end

  # def edit
  #   render :edit
  # end

  # def update
  #   @user = User.find_by(id: params[:id])
  #   if @user.update
  #     redirect_to user_url(@user.id)
  #   else
  #     render json: "unable to update user", status: 422
  #   end
  # end

  # def destroy
  #   @user = User.find_by(id: params[:id])
  #   @user.destroy unless @user == nil
  #   redirect_to users_url
  # end

  private 

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
