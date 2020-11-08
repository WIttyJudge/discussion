class ErrorsController < ApplicationController
  def page_not_found
    render file: 'errors/404', status: :not_found
  end
end