# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    # find the post by post_id
    @post = Post.find(params[:post_id])
    # create a comment on related post
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :acomment)
  end
end
