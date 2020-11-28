module Admin
  class PostsController < BaseController
    before_action :set_post, only: %i[destroy]

    def index
      @posts = Post.includes(:author)
    end

    def destroy
      @post.destroy

      text = 'Post was successfully deleted.'
      flash[:notice] = text
      redirect_to admin_posts_path
    end

    private

    def set_post
      @post = Post.find_by(slug: params[:slug])
    end
  end
end
