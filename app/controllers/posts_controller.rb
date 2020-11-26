class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :set_author, only: %i[create]
  before_action :set_post, only: %i[
    show edit destroy delete_confirm
  ]

  def show; end

  def new
    authorize Post

    @post = Post.new
    @tags = Tag.pluck(:name)
  end

  def create
    authorize Post
    @post = @author.posts.create(post_params)

    unless @post.save
      render :new
      return
    end

    text = 'Post successfuly create'
    flash[:notice] = text
    redirect_to post_path(@post.slug)
  end

  def edit
    authorize @post
  end

  def update; end

  def destroy
    authorize @post

    @post.destroy
    flash[:notice] = 'Post deleted'
    redirect_to root_path
  end

  def delete_confirm
    authorize @post
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
