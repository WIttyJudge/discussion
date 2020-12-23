module Api
  module V0
    class PostsController < ApiController
      before_action :set_post, only: %i[show destroy]

      def index
        @posts = pagy(Post.all)
        respond_with PostSerializer.new(@posts, include: [:tags]).serializable_hash
      end

      def show
        respond_with PostSerializer.new(@post, include: [:replies]).serializable_hash
      end

      def create
        @post = Post.create(post_params)

        if @post.save
          respond_with PostSerializer.new(@post).serializable_hash, status: :created,
                                                                    location: api_v0_post_path(@post.slug)
        else
          message = @post.errors.full_messages.to_sentence
          error_unprocessable_entity(message)
        end
      end

      def destroy
        @post.destroy
        render json: { message: 'Post was successfully deleted.' }
      end

      private

      def set_post
        @post = Post.find_by(slug: params[:slug])
        return error_not_found unless @post
      end

      def post_params
        params.require(:post).permit(:title, :body, :author_id, :tag_ids)
      end
    end
  end
end
