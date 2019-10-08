class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    render :new
  end

  def create
    @comment = Comment.new(comm_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "You created a successful comment. Good Job!"
      redirect_to post_url(@comment.post_id)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    render :show
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy if @comment.user_id == current_user.id || current_user.id == @comment.post.sub.moderator_id
    redirect_to post_url(@comment.post_id)
  end
  
  def comm_params
    params.require(:comment).permit(:content)
  end
end
