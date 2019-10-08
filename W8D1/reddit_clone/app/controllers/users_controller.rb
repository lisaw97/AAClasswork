class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.id == current_user.id 
      @user.destroy
      redirect_to new_user_url
    else
      flash.now[:errors] = 'You cant do that!!'
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
