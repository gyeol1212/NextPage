class CommentsController < ApplicationController
  before_action :check_ownership, only: [:destroy]

  def create
    @comment=Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.js
      end
    end

    redirect_to :back
  end

  def destroy
    @comment=Comment.find(params[:id])
    if @comment.destroy
      respond_to do |format|
        format.js
      end
    end

    redirect_to :back
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def check_ownership
    @comment = Comment.find(params[:id])
    redirect_to :back if @comment.user_id != current_user.id
  end
end
