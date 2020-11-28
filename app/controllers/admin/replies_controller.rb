module Admin
  class RepliesController < BaseController
    def index
      @replies = Reply.includes(:user)
    end
  end
end
