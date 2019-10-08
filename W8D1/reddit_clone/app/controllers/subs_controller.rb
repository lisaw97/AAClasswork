class SubsController < ApplicationController
  before_action :require_login, except: [:show, :index]
  before_action :mod_check, only: [:edit, :update]



  def new
    @sub = Sub.new
    render :new
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  def index
    @subs = Sub.all 
    render :index
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub.update!(sub_params)
      flash[:success] = 'Sub successfully updated!'
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end


  def mod_check
    @sub = Sub.find_by(id: params[:id])
    unless @sub.moderator_id == current_user.id
      flash[:error] = "Only the moderator may edit the Sub foooool"
      redirect_to sub_url(@sub)
    end
  end

end
