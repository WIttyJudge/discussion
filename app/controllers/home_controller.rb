class HomeController < ApplicationController
  def index
    @posts = Post.includes(:author, :tags, :replies).recent
    @tags = Tag.alphabetical
  end
end
