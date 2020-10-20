class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_user, only: %i[ create ]
  before_action :set_post, only: %i[ show destroy ]

  def index
    @posts = Post.includes(:user).recent
    @tags = Tag.alphabetical
  end

  def show
  end

  def new
    @post = Post.new
    @tags = Tag.pluck(:name)
  end

  def create
    @post = @user.posts.create(post_params)

    if @post
      text = "Post successfuly created"
      flash[:notice] = text
      redirect_to post_path(@post.slug)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    authorize! :destroy, @post

    @post.destroy
    flash[:notice] = "Post deleted"
    redirect_to posts_path
  end

  private

  def set_user
    @user = current_user
  end

  def set_post
    @post = Post.find_by(slug: params[:slug])
  end

  def post_params
    params.require(:post).permit(:title, :body, :tag_ids)
  end
end