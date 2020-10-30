class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_author, only: %i[create]
  before_action :set_post, only: %i[show destroy]

  def index
    @posts = Post.includes(:author).recent
    @tags = Tag.alphabetical
  end

  def show; end

  def new
    @post = Post.new
    @tags = Tag.pluck(:name)
  end

  def create
    @post = @author.posts.create(post_params)

    return unless @post

    redirect_to post_path(@post.slug)
    text = 'Post successfuly create'
    flash[:notice] = text
  end

  def edit; end

  def update; end

  def destroy
    authorize @post

    @post.destroy
    flash[:notice] = 'Post deleted'
    redirect_to posts_path
  end

  private

  def set_author
    @author = current_user
  end

  def set_post
    @post = Post.find_by(slug: params[:slug])
  end

  def post_params
    params.require(:post).permit(:title, :body, :tag_ids)
  end
end
