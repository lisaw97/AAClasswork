class PostsController < ApplicationController

  before_action :require_login, except: [:show]
  before_action :edit_check, only: [:edit, :update]


  def new
    @post = Post.new
    render :new
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.user_id == current_user.id || current_user.id == @post.sub.moderator_id
      @post.destroy
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] = 'Hey dummy, you cannot delete others posts!!'
      render :show
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save!
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update!(post_params)
      flash[:success] = 'Post successfully updated'
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

  def edit_check
    @post = Post.find_by(id: params[:id])
    redirect_to post_url(@post) unless @post.user_id == current_user.id || current_user.id == @post.sub.moderator_id
  end
end
