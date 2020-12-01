module Admin
  class RepliesController < BaseController
    before_action :set_reply, only: %i[destroy]

    def index
      @replies = Reply.includes(:user)
    end

    def destroy
      @reply.destroy

      text = 'Reply was successfully deleted.'
      flash[:notice] = text
      redirect_to admin_replies_path
    end

    private

    def set_reply
      @reply = Reply.find(params[:id])
    end
  end
end
