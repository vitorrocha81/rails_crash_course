class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])

    if @post.comments.create(comments_params)
      redirect_to @post, notice: "Comments Created Successfully"
    else
      redirect_to @post, alert: "Error creating comment."
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @post, notice: "Post deleted"
  end
end

private
  def comments_params
    params.require(:comment).permit(:author,:body,:email)
  end