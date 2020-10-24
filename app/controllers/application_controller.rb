class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do
    render file: 'static/403', status: :forbidden, layout: false
  end
end
