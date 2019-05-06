# frozen_string_literal: true

class PostsController < ApplicationController
  # gets all posts
  def index
    @post = Post.all.order('created_at DESC')
  end

  # initialize post into @post renders form
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  # create post and pass in data
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to action: 'show', id: @post
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
