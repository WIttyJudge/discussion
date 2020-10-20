class RepliesController < ApplicationController
  def new

  end

  def create
  end

  private

  def set_post
    @post = Post.find_by(slug: params[:post_slug])
  end
end