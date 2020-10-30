class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render file: 'static/403', status: :forbidden, layout: false
  end
end
