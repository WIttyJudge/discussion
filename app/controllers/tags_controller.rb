class TagsController < ApplicationController
  before_action :set_tag, only: %i[show]

  def show
    @pagy, @posts = pagy(@tag.posts.includes(:author, :tags, :replies))
  end

  def new
    @tag = Tag.new
  end

  private

  def set_tag
    @tag = Tag.find_by(slug: params[:slug])
  end
end
