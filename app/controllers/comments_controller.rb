# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    # find the post by post_id
    @post = Post.find(params[:post_id])
    # create a comment on related post
    @comment = @post.comments.create(params[:comment]).permit(:name, :acomment)
    redirect_to post_path(@post)
  end
end
