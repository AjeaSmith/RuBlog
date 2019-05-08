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
      flash[:success] = 'Post was successfully saved!'
      redirect_to action: 'show'
    else
      flash[:danger] = 'Error creating post'
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = 'Post was successfully deleted.'
      redirect_to posts_url
    else
      flash[:danger] = 'Could not delete post'
      redirect_to post_url
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:info] = 'Post was successfully updated'
      redirect_to @post
    else
      flash[:danger] = 'Error updating post'
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
