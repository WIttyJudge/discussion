class RepliesController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :set_post, only: %i[create]

  def create
    @reply = @post.replies.create(params[:reply].permit(:reply, :post_id))
    @reply.user_id = current_user.id

    flash[:notice] = 'bad'

    return unless @reply.save

    flash[:notice] = 'Okay'
  end

  private

  def set_post
    @post = Post.find_by(slug: params[:post_slug])
  end

  def reply_params
    params.require(:reply).permit(:reply, :user_id, :post_id)
  end
end
