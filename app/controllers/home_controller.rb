class HomeController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.includes(:author, :tags, :replies).recent)
    @tags = Tag.alphabetical
  end
end
