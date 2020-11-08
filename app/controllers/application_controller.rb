class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery

  private

  def user_not_authorized
    # render file: 'errors/403', status: :forbidden, layout: false
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path
  end
end
