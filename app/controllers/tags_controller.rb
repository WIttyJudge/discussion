class TagsController < ApplicationController
  before_action :set_tag, only: %i[show]
  before_action :tag_params, only: %i[create]

  def show
    @posts = @tag.posts
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
  end

  private

  def set_tag
    @tag = Tag.find_by(slug: params[:slug])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
