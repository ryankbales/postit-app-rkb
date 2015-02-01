class CommentsController < ApplicationController
  before_action :require_user
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params.require(:comment).permit(:body))
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Your comment was added."
      redirect_to post_path(@post)
    else
      flash[:errors] = "Your comment can't be blank."
      redirect_to :back
    end

  end

  def vote
    comment = Comment.find(params[:id])
    @vote = Vote.create(voteable: comment, user: current_user, vote: params[:vote])
    if @vote.valid?
      flash[:notice] = "Your vote was counted."
    else
      flash[:error] = "Didn't you already vote on this comment?"
    end
    redirect_to :back
  end
end