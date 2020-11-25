class RepliesController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :set_post, only: %i[create]

  def create
    @reply = @post.replies.create(reply_params)
    @reply.user_id = current_user.id

    return unless @reply.save
  end

  private

  def set_post
    @post = Post.find_by(slug: params[:post_slug])
  end

  def reply_params
    params.require(:reply).permit(:reply)
  end
end
