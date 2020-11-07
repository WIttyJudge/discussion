class HomeController < ApplicationController
  def index
    @posts = Post.includes(:author, :tags).recent
    @tags = Tag.alphabetical
  end
end
